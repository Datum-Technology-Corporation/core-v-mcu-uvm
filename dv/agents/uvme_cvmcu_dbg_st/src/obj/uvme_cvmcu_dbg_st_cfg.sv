// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_DBG_ST_CFG_SV__
`define __UVME_CVMCU_DBG_ST_CFG_SV__


/**
 * Object encapsulating all parameters for creating, connecting and running CORE-V-MCU Debug Interface UVM Agent Self-Testing Environment (uvme_cvmcu_dbg_st_env_c).
 * @ingroup uvme_cvmcu_dbg_st_obj
 */
class uvme_cvmcu_dbg_st_cfg_c extends uvmx_agent_env_cfg_c;

   /// @name Integrals
   /// @{
   rand bit  drv_idle_random; ///< Specifies the type of data to send during idle cycles
   /// @}

   /// @name Objects
   /// @{
   rand uvma_cvmcu_dbg_cfg_c  core_cfg; ///< CORE Agent configuration.
   rand uvma_cvmcu_dbg_cfg_c  sys_cfg; ///< SYS Agent configuration.
   rand uvma_cvmcu_dbg_cfg_c  passive_cfg; ///< Passive Agent configuration.
   rand uvml_sb_simplex_cfg_c  sb_agent_cfg; ///< Agent Scoreboard configuration.
   rand uvml_sb_simplex_cfg_c  sb_e2e_cfg  ; ///<  End-to-end Scoreboard configuration.
   /// @}


   `uvm_object_utils_begin(uvme_cvmcu_dbg_st_cfg_c)
      `uvm_field_int (                         enabled              , UVM_DEFAULT          )
      `uvm_field_enum(uvm_active_passive_enum, is_active            , UVM_DEFAULT          )
      `uvm_field_int (                         drv_idle_random      , UVM_DEFAULT          )
      `uvm_field_enum(uvmx_reset_type_enum   , reset_type           , UVM_DEFAULT          )
      `uvm_field_int (                         scoreboarding_enabled, UVM_DEFAULT          )
      `uvm_field_int (                         cov_model_enabled    , UVM_DEFAULT          )
      `uvm_field_int (                         trn_log_enabled      , UVM_DEFAULT          )
      `uvm_field_int (                         cov_model_enabled    , UVM_DEFAULT          )
      `uvm_field_object(core_cfg, UVM_DEFAULT)
      `uvm_field_object(sys_cfg, UVM_DEFAULT)
      `uvm_field_object(passive_cfg, UVM_DEFAULT)
      `uvm_field_object(sb_agent_cfg, UVM_DEFAULT)
      `uvm_field_object(sb_e2e_cfg, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Sets all configuration fields for agent configurations.
    */
   constraint agents_cfg_cons {
      core_cfg.bypass_mode == 0;
      sys_cfg.bypass_mode == 0;
      passive_cfg.bypass_mode == 0;
      core_cfg.drv_mode == UVMA_CVMCU_DBG_DRV_MODE_CORE;
      sys_cfg.drv_mode == UVMA_CVMCU_DBG_DRV_MODE_SYS;
      core_cfg.drv_idle_random == drv_idle_random;
      sys_cfg.drv_idle_random == drv_idle_random;
      core_cfg.reset_type == reset_type;
      sys_cfg.reset_type == reset_type;
      passive_cfg.reset_type == reset_type;
      core_cfg.enabled == enabled;
      sys_cfg.enabled == enabled;
      passive_cfg.enabled == enabled;
      passive_cfg.is_active == UVM_PASSIVE;
      core_cfg.is_active == is_active;
      sys_cfg.is_active == is_active;
      core_cfg.cov_model_enabled == cov_model_enabled;
      sys_cfg.cov_model_enabled == cov_model_enabled;
      passive_cfg.cov_model_enabled == cov_model_enabled;
      core_cfg.trn_log_enabled == trn_log_enabled;
      sys_cfg.trn_log_enabled == trn_log_enabled;
      passive_cfg.trn_log_enabled == trn_log_enabled;
   }

   /**
    * Sets all configuration fields for Scoreboard configurations.
    */
   constraint sb_e2e_cfg_cons {
      sb_agent_cfg.mode == UVML_SB_MODE_IN_ORDER;
      sb_e2e_cfg.mode == UVML_SB_MODE_IN_ORDER;
      sb_agent_cfg.enabled == scoreboarding_enabled;
      sb_e2e_cfg.enabled == scoreboarding_enabled;
   }


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_dbg_st_cfg");
      super.new(name);
   endfunction

   /**
    * Creates objects.
    */
   virtual function void create_objects();
      core_cfg = uvma_cvmcu_dbg_cfg_c::type_id::create("core_cfg");
      sys_cfg = uvma_cvmcu_dbg_cfg_c::type_id::create("sys_cfg");
      passive_cfg = uvma_cvmcu_dbg_cfg_c::type_id::create("passive_cfg");
      sb_agent_cfg = uvml_sb_simplex_cfg_c::type_id::create("sb_agent_cfg");
      sb_e2e_cfg   = uvml_sb_simplex_cfg_c::type_id::create("sb_e2e_cfg"  );
   endfunction

   /**
    * Adds fields to Scoreboard logs.
    */
   function void post_randomize();
      sb_agent_cfg.reset_log();
      sb_e2e_cfg  .reset_log();
      sb_agent_cfg.add_to_log("size");
      sb_e2e_cfg  .add_to_log("size");
      sb_agent_cfg.add_to_log("data");
      sb_e2e_cfg  .add_to_log("data");
   endfunction

endclass : uvme_cvmcu_dbg_st_cfg_c


`endif // __UVME_CVMCU_DBG_ST_CFG_SV__