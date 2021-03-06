// Copyright 2022 Datum Technology Corporation
// Copyright 2022 Low Power Futures
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_TIMER_ENV_SV__
`define __UVME_APB_TIMER_ENV_SV__


/**
 * Top-level component that encapsulates, builds and connects all other APB Timer Sub-System environment components.
 */
class uvme_apb_timer_env_c extends uvml_env_c;

   /// @defgroup Objects
   /// @{
   uvme_apb_timer_cfg_c    cfg  ; ///< Configuration handle.  Must be provided by component instantiating this environment.
   uvme_apb_timer_cntxt_c  cntxt; ///< Context handle.  Can be provided by component instantiating this environment.
   /// @}

   /// @defgroup Register Abstraction Layer (RAL)
   /// @{
   uvme_apb_timer_reg_block_c  reg_block  ; ///< Top-level register block for {name_normal_case} Sub-System.
   uvma_apb_reg_adapter_c      reg_adapter; ///< Converts apb sequence items to/from register operations.
   /// @}

   /// @defgroup Components
   /// @{
   uvme_apb_timer_vsqr_c       vsequencer; ///< Virtual sequencer on which virtual sequences are run.
   uvme_apb_timer_prd_c        predictor ; ///< Feeds #sb's expected port(s) with monitor transactions.
   uvme_apb_timer_sb_c         sb        ; ///< Ensures that transactions from #predictor and monitors match.
   uvme_apb_timer_cov_model_c  cov_model ; ///< Functional coverage model.
   /// @}

   /// @defgroup Environment(s)
   /// @{
   // TODO: Add sub-environments
   //       Ex: uvme_sub_env_env_c  sub_env; ///< Describe me!
   /// @}

   /// @defgroup Agents
   /// @{
   uvma_clk_agent_c    sys_clk_agent  ; ///< Clocking agent
   uvma_reset_agent_c  sys_reset_agent; ///< Reset agent
   uvma_apb_agent_c    apb_agent      ; ///< Register access agent
   /// @}


   `uvm_component_utils_begin(uvme_apb_timer_env_c)
      `uvm_field_object(cfg  , UVM_DEFAULT)
      `uvm_field_object(cntxt, UVM_DEFAULT)
   `uvm_component_utils_end


   /**
    * Default constructor.
    */
   extern function new(string name="uvme_apb_timer_env", uvm_component parent=null);

   /**
    * 1. Ensures cfg & cntxt handles are not null
    * 2. Assigns cfg and cntxt handles via assign_cfg() & assign_cntxt()
    * 3. Creates all components via create_<x>()
    */
   extern virtual function void build_phase(uvm_phase phase);

   /**
    * 1. Connects agents to predictor via connect_predictor()
    * 2. Connects ral to predictor & provisioning agent via connect_reg_block()
    * 3. Connects predictor & agents to scoreboard via connect_scoreboard()
    * 4. Assembles virtual sequencer handles via assemble_vsequencer()
    * 5. Connects agents to coverage model via connect_coverage_model()
    */
   extern virtual function void connect_phase(uvm_phase phase);

   /**
    * Assigns configuration handles to components using UVM Configuration Database.
    */
   extern function void assign_cfg();

   /**
    * Assigns context handles to components using UVM Configuration Database.
    */
   extern function void assign_cntxt();

   /**
    * Creates sub-environment components.
    */
   extern function void create_sub_envs();

   /**
    * Creates agent components.
    */
   extern function void create_agents();

   /**
    * Creates ral_adapter which translates to/from ral to apb_agent.
    */
   extern function void create_reg_adapter();

   /**
    * Creates additional (non-agent) environment components (and objects).
    */
   extern function void create_env_components();

   /**
    * Creates environment's virtual sequencer.
    */
   extern function void create_vsequencer();

   /**
    * Creates environment's coverage model.
    */
   extern function void create_cov_model();

   /**
    * Connects agents to predictor.
    */
   extern function void connect_predictor();

   /**
    * Connects scoreboards components to agents/predictor.
    */
   extern function void connect_scoreboard();

   /**
    * Connects RAL to provisioning agent (apb_agent).
    */
   extern function void connect_reg_block();

   /**
    * Connects environment coverage model to agents/scoreboards/predictor.
    */
   extern function void connect_coverage_model();

   /**
    * Assembles virtual sequencer from agent sequencers.
    */
   extern function void assemble_vsequencer();

endclass : uvme_apb_timer_env_c


function uvme_apb_timer_env_c::new(string name="uvme_apb_timer_env", uvm_component parent=null);

   super.new(name, parent);

endfunction : new


function void uvme_apb_timer_env_c::build_phase(uvm_phase phase);

   super.build_phase(phase);

   void'(uvm_config_db#(uvme_apb_timer_cfg_c)::get(this, "", "cfg", cfg));
   if (!cfg) begin
      `uvm_fatal("APB_TIMER_ENV", "Configuration handle is null")
   end
   else begin
      `uvm_info("APB_TIMER_ENV", $sformatf("Found configuration handle:\n%s", cfg.sprint()), UVM_DEBUG)
   end

   void'(uvm_config_db#(uvme_apb_timer_cntxt_c)::get(this, "", "cntxt", cntxt));
   if (!cntxt) begin
      `uvm_info("APB_TIMER_ENV", "Context handle is null; creating.", UVM_DEBUG)
      cntxt = uvme_apb_timer_cntxt_c::type_id::create("cntxt");
   end

   assign_cfg           ();
   assign_cntxt         ();
   create_sub_envs      ();
   create_agents        ();
   create_reg_adapter   ();
   create_env_components();
   create_vsequencer    ();
   create_cov_model     ();

endfunction : build_phase


function void uvme_apb_timer_env_c::connect_phase(uvm_phase phase);

   super.connect_phase(phase);

   connect_reg_block();
   assemble_vsequencer();

   if (cfg.scoreboarding_enabled) begin
      connect_predictor ();
      connect_scoreboard();
   end

   if (cfg.cov_model_enabled) begin
      connect_coverage_model();
   end

endfunction: connect_phase


function void uvme_apb_timer_env_c::assign_cfg();

   uvm_config_db#(uvme_apb_timer_cfg_c)::set(this, "*", "cfg", cfg);
   uvm_config_db#(uvma_clk_cfg_c)::set(this, "sys_clk_agent", "cfg", cfg.sys_clk_cfg);
   uvm_config_db#(uvma_reset_cfg_c)::set(this, "sys_reset_agent", "cfg", cfg.sys_reset_cfg);
   uvm_config_db#(uvma_apb_cfg_c)::set(this, "apb_agent", "cfg", cfg.apb_cfg);

   // TODO Assign sub-environment cfg handle
   //      Ex: uvm_config_db#(uvme_sub_env_cfg_c)::set(this, "sub_env", "cfg", cfg.sub_env_cfg);

endfunction: assign_cfg


function void uvme_apb_timer_env_c::assign_cntxt();

   uvm_config_db#(uvme_apb_timer_cntxt_c)::set(this, "*", "cntxt", cntxt);
   uvm_config_db#(uvma_clk_cntxt_c)::set(this, "sys_clk_agent", "cntxt", cntxt.sys_clk_cntxt);
   uvm_config_db#(uvma_reset_cntxt_c)::set(this, "sys_reset_agent", "cntxt", cntxt.sys_reset_cntxt);
   uvm_config_db#(uvma_apb_cntxt_c)::set(this, "apb_agent", "cntxt", cntxt.apb_cntxt);

   // TODO Assign sub-environment cntxt handle
   //      Ex: uvm_config_db#(uvme_sub_env_cntxt_c)::set(this, "sub_env", "cntxt", cntxt.sub_env_cntxt);

endfunction: assign_cntxt


function void uvme_apb_timer_env_c::create_sub_envs();

   // TODO: Create sub-environments
   //       Ex: sub_env = uvme_sub_env_c::type_id::create("sub_env");

endfunction: create_sub_envs


function void uvme_apb_timer_env_c::create_agents();

   sys_clk_agent = uvma_clk_agent_c::type_id::create("sys_clk_agent", this);
   sys_reset_agent = uvma_reset_agent_c::type_id::create("sys_reset_agent", this);
   apb_agent = uvma_apb_agent_c::type_id::create("apb_agent", this);

endfunction: create_agents


function void uvme_apb_timer_env_c::create_env_components();

   if (cfg.scoreboarding_enabled) begin
      predictor = uvme_apb_timer_prd_c::type_id::create("predictor", this);
      sb        = uvme_apb_timer_sb_c ::type_id::create("sb"       , this);
   end

endfunction: create_env_components


function void uvme_apb_timer_env_c::create_reg_adapter();

   reg_adapter = uvma_apb_reg_adapter_c::type_id::create("reg_adapter");
   reg_block   = cfg.apb_timer_reg_block;

endfunction: create_reg_adapter


function void uvme_apb_timer_env_c::create_vsequencer();

   vsequencer = uvme_apb_timer_vsqr_c::type_id::create("vsequencer", this);

endfunction: create_vsequencer


function void uvme_apb_timer_env_c::create_cov_model();

   cov_model = uvme_apb_timer_cov_model_c::type_id::create("cov_model", this);

endfunction: create_cov_model


function void uvme_apb_timer_env_c::connect_predictor();

   sys_clk_agent.mon_ap.connect(predictor.sys_clk_export);
   sys_reset_agent.mon_ap.connect(predictor.sys_reset_export);
   apb_agent.mon_ap.connect(predictor.apb_export);

endfunction: connect_predictor


function void uvme_apb_timer_env_c::connect_scoreboard();

   // TODO Connect agents -> scoreboard
   //      Ex: apb_agent.mon_ap.connect(sb.apb_sb.act_export);

   // TODO Connect predictor -> scoreboard
   //      Ex: predictor.apb_ap.connect(sb.apb_sb.exp_export);

endfunction: connect_scoreboard


function void uvme_apb_timer_env_c::connect_reg_block();

   reg_block.cntxt = cntxt;
   reg_block.connect();
   reg_block.default_map.set_sequencer(apb_agent.sequencer, reg_adapter);
   reg_block.default_map.set_auto_predict(1);

endfunction: connect_reg_block


function void uvme_apb_timer_env_c::connect_coverage_model();

   // TODO Implement uvme_apb_timer_env_c::connect_coverage_model()
   //      Ex: apb_agent.mon_ap.connect(cov_model.apb_export);

endfunction: connect_coverage_model


function void uvme_apb_timer_env_c::assemble_vsequencer();

   vsequencer.sys_clk_sequencer = sys_clk_agent.sequencer;
   vsequencer.sys_reset_sequencer = sys_reset_agent.sequencer;
   vsequencer.apb_sequencer = apb_agent.sequencer;

endfunction: assemble_vsequencer


`endif // __UVME_APB_TIMER_ENV_SV__
