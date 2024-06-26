// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_TCOUNTER_B_CP_SEQ_ITEM_SV__
`define __UVMA_TCOUNTER_B_CP_SEQ_ITEM_SV__


/**
 * Sequence Item providing stimulus for the Control Plane driver (uvma_tcounter_b_cp_drv_c).
 * @ingroup uvma_tcounter_b_seq
 */
class uvma_tcounter_b_cp_seq_item_c extends uvmx_seq_item_c #(
   .T_CFG  (uvma_tcounter_b_cfg_c  ),
   .T_CNTXT(uvma_tcounter_b_cntxt_c)
);

   /// @name Data
   /// @{
   rand bit                                  reset_count_i  ; ///< Resets counter
   rand bit                                  enable_count_i ; ///< Enables counter
   rand uvma_tcounter_b_compare_value_i_b_t  compare_value_i; ///< Comparator value
   /// @}

   /// @name Metadata
   /// @{
   /// @}


   `uvm_object_utils_begin(uvma_tcounter_b_cp_seq_item_c)
      `uvm_field_int(reset_count_i, UVM_DEFAULT)
      `uvm_field_int(enable_count_i, UVM_DEFAULT)
      `uvm_field_int(compare_value_i, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvma_tcounter_b_cp_seq_item");
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


`endif // __UVMA_TCOUNTER_B_CP_SEQ_ITEM_SV__