// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// This file contains sample code that demonstrates how to add an instance of the Timer unit counter Block UVM Environment to an example UVMx environment.
// NOTE: It is recommended to split up classes into separate files.


`ifndef __UVME_EXAMPLE_ENV_CFG_SV__
`define __UVME_EXAMPLE_ENV_CFG_SV__


/**
 * Object encapsulating all configuration information for uvme_example_env_c.
 */
class uvme_example_env_cfg_c extends uvmx_env_cfg_c;

   rand uvme_tcounter_b_cfg_c  tcounter_b_cfg; ///< Handle to tcounter_b environment configuration

   `uvm_object_utils_begin(uvme_example_env_cfg_c)
      `uvm_field_object(tcounter_b_cfg, UVM_DEFAULT)
   `uvm_object_utils_end

   constraint defaults_cons {
      soft tcounter_b_cfg.enabled == 1;
   }

   function new(uvm_component parent=null, string name="uvme_example_env_cfg");
      super.new(parent, name);
   endfunction

   virtual function void create_objects();
      tcounter_b_cfg = uvme_tcounter_b_cfg_c::type_id::create("tcounter_b_cfg");
   endfunction

endclass : uvme_example_env_cfg_c


`endif // __UVME_EXAMPLE_ENV_CFG_SV__


`ifndef __UVME_EXAMPLE_ENV_CNTXT_SV__
`define __UVME_EXAMPLE_ENV_CNTXT_SV__


/**
 * Object encapsulating all state variables for uvme_example_env_c.
 */
class uvme_example_env_cntxt_c extends uvmx_env_cntxt_c;

   uvme_tcounter_b_cntxt_c  tcounter_b_cntxt; ///< Handle to tcounter_b environment context

   `uvm_object_utils_begin(uvme_example_env_cntxt_c)
      `uvm_field_object(tcounter_b_cntxt, UVM_DEFAULT)
   `uvm_object_utils_end

   function new(uvm_component parent=null, string name="uvme_example_env_cntxt");
      super.new(parent, name);
   endfunction

   virtual function void create_objects();
      tcounter_b_cntxt = uvme_tcounter_b_cntxt_c::type_id::create("tcounter_b_cntxt");
   endfunction

endclass : uvme_example_env_cntxt_c


`endif // __UVME_EXAMPLE_ENV_CNTXT_SV__


`ifndef __UVME_EXAMPLE_ENV_SV__
`define __UVME_EXAMPLE_ENV_SV__


/**
 * Environment component.
 */
class uvme_example_env_c extends uvmx_env_c #(
   .T_CFG      (uvme_example_env_cfg_c      ),
   .T_CNTXT    (uvme_example_env_cntxt_c    ),
   .T_SQR      (uvme_example_env_sqr_c      ),
   .T_PRD      (uvme_example_env_prd_c      ),
   .T_SB       (uvme_example_env_sb_c       ),
   .T_COV_MODEL(uvme_example_env_cov_model_c)
);

   uvme_tcounter_b_env_c  tcounter_b_env; ///< Timer unit counter Block Environment instance.

   `uvm_component_utils_begin(uvme_example_env_c)
   `uvm_component_utils_end

   function new(uvm_component parent=null, string name="uvme_example_env");
      super.new(parent, name);
   endfunction

   virtual function void assign_cfg();
      uvm_config_db#(uvme_tcounter_b_cfg_c)::set(this, "tcounter_b_env", "cfg", cfg.tcounter_b_cfg);
   endfunction

   virtual function void assign_cntxt();
      uvm_config_db#(uvme_tcounter_b_cntxt_c)::set(this, "tcounter_b_env", "cntxt", cfg.tcounter_b_cntxt);
   endfunction

   virtual function void create_envs();
      tcounter_b_env = uvme_tcounter_b_env_c::type_id::create("tcounter_b_env", this);
   endfunction

endclass : uvme_example_env_c


`endif // __UVME_EXAMPLE_ENV_SV__