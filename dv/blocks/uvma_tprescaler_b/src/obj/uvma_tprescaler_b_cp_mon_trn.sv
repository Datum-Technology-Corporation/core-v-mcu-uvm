// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_TPRESCALER_B_CP_MON_TRN_SV__
`define __UVMA_TPRESCALER_B_CP_MON_TRN_SV__


/**
 * Control Plane monitor transaction sampled by uvma_tprescaler_b_cp_mon_c.
 * @ingroup uvma_tprescaler_b_obj
 */
class uvma_tprescaler_b_cp_mon_trn_c extends uvmx_mon_trn_c #(
   .T_CFG  (uvma_tprescaler_b_cfg_c  ),
   .T_CNTXT(uvma_tprescaler_b_cntxt_c)
);

   /// @name Data
   /// @{
   logic                                  reset_count_i  ; ///< 
   logic                                  enable_count_i ; ///< 
   uvma_tprescaler_b_compare_value_i_l_t  compare_value_i; ///< 
   /// @}

   /// @name Metadata
   /// @{
   /// @}


   `uvm_object_utils_begin(uvma_tprescaler_b_cp_mon_trn_c)
      `uvm_field_int(reset_count_i, UVM_DEFAULT)
      `uvm_field_int(enable_count_i, UVM_DEFAULT)
      `uvm_field_int(compare_value_i, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvma_tprescaler_b_cp_mon_trn");
      super.new(name);
   endfunction

   /**
    * Describes transaction for logger.
    */
   virtual function uvmx_metadata_t get_metadata();
      string reset_count_i_str;
      string enable_count_i_str;
      string compare_value_i_str;
      reset_count_i_str = $sformatf("%b", reset_count_i);
      enable_count_i_str = $sformatf("%b", enable_count_i);
      compare_value_i_str = $sformatf("%h", compare_value_i);
      `uvmx_metadata_field("reset_count_i", reset_count_i_str)
      `uvmx_metadata_field("enable_count_i", enable_count_i_str)
      `uvmx_metadata_field("compare_value_i", compare_value_i_str)
   endfunction

endclass


`endif // __UVMA_TPRESCALER_B_CP_MON_TRN_SV__