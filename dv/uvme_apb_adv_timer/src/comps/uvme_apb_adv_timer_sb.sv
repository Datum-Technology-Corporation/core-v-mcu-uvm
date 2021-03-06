// Copyright 2022 Datum Technology Corporation
// Copyright 2022 Low Power Futures
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_ADV_TIMER_SB_SV__
`define __UVME_APB_ADV_TIMER_SB_SV__


/**
 * Component encapsulating scoreboards which compare APB Advanced Timer Sub-System's expected (from predictor) vs. actual (monitored) transactions.
 */
class uvme_apb_adv_timer_sb_c extends uvm_scoreboard;

   /// @defgroup Objects
   /// @{
   uvme_apb_adv_timer_cfg_c    cfg  ; ///< Environment configuration handle
   uvme_apb_adv_timer_cntxt_c  cntxt; ///< Environment context handle
   /// @}

   /// @defgroup Components
   /// @{
   // TODO Add sub-scoreboards
   //      Ex: uvml_sb_simplex_c  egress_sb ; ///< Describe me!
   //          uvml_sb_simplex_c  ingress_sb; ///< Describe me!
   /// @}


   `uvm_component_utils_begin(uvme_apb_adv_timer_sb_c)
      `uvm_field_object(cfg  , UVM_DEFAULT)
      `uvm_field_object(cntxt, UVM_DEFAULT)
   `uvm_component_utils_end


   /**
    * Default constructor.
    */
   extern function new(string name="uvme_apb_adv_timer_sb", uvm_component parent=null);

   /**
    * Create and configures sub-scoreboards via:
    * 1. assign_cfg()
    * 2. assign_cntxt()
    * 3. create_sbs()
    */
   extern virtual function void build_phase(uvm_phase phase);

   /**
    * Assigns configuration handles.
    */
   extern function void assign_cfg();

   /**
    * Assigns context handles.
    */
   extern function void assign_cntxt();

   /**
    * Creates sub-scoreboard components.
    */
   extern function void create_sbs();

endclass : uvme_apb_adv_timer_sb_c


function uvme_apb_adv_timer_sb_c::new(string name="uvme_apb_adv_timer_sb", uvm_component parent=null);

   super.new(name, parent);

endfunction : new


function void uvme_apb_adv_timer_sb_c::build_phase(uvm_phase phase);

   super.build_phase(phase);

   void'(uvm_config_db#(uvme_apb_adv_timer_cfg_c)::get(this, "", "cfg", cfg));
   if (!cfg) begin
      `uvm_fatal("APB_ADV_TIMER_SB", "Configuration handle is null")
   end

   void'(uvm_config_db#(uvme_apb_adv_timer_cntxt_c)::get(this, "", "cntxt", cntxt));
   if (!cntxt) begin
      `uvm_fatal("APB_ADV_TIMER_SB", "Context handle is null")
   end

   assign_cfg  ();
   assign_cntxt();
   create_sbs  ();

endfunction : build_phase


function void uvme_apb_adv_timer_sb_c::assign_cfg();

   // TODO Implement uvme_apb_adv_timer_sb_c::assign_cfg()
   //      Ex: uvm_config_db#(uvml_sb_simplex_cfg_c)::set(this, "egress_sb" , "cfg", cfg.sb_egress_cfg );
   //          uvm_config_db#(uvml_sb_simplex_cfg_c)::set(this, "ingress_sb", "cfg", cfg.sb_ingress_cfg);

endfunction : assign_cfg


function void uvme_apb_adv_timer_sb_c::assign_cntxt();

   // TODO Implement uvme_apb_adv_timer_sb_c::assign_cntxt()
   //      Ex: uvm_config_db#(uvml_sb_simplex_cntxt_c)::set(this, "egress_sb" , "cntxt", cntxt.sb_egress_cntxt );
   //          uvm_config_db#(uvml_sb_simplex_cntxt_c)::set(this, "ingress_sb", "cntxt", cntxt.sb_ingress_cntxt);

endfunction : assign_cntxt


function void uvme_apb_adv_timer_sb_c::create_sbs();

   // TODO Implement uvme_apb_adv_timer_sb_c::create_sbs()
   //      Ex: egress_sb  = uvml_sb_simplex_c::type_id::create("egress_sb" , this);
   //          ingress_sb = uvml_sb_simplex_c::type_id::create("ingress_sb", this);

endfunction : create_sbs


`endif // __UVME_APB_ADV_TIMER_SB_SV__
