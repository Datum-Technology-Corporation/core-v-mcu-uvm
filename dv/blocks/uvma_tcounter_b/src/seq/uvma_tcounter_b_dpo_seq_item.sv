// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_TCOUNTER_B_DPO_SEQ_ITEM_SV__
`define __UVMA_TCOUNTER_B_DPO_SEQ_ITEM_SV__


/**
 * Sequence Item providing stimulus for the Data Plane Output driver (uvma_tcounter_b_dpo_drv_c).
 * @ingroup uvma_tcounter_b_seq
 */
class uvma_tcounter_b_dpo_seq_item_c extends uvmx_seq_item_c #(
   .T_CFG  (uvma_tcounter_b_cfg_c  ),
   .T_CNTXT(uvma_tcounter_b_cntxt_c)
);

   /// @name Data
   /// @{
   /// @}

   /// @name Metadata
   /// @{
   uvma_tcounter_b_counter_value_o_l_t  counter_value_o ; ///< Output counter value
   logic                                target_reached_o; ///< Counter equals compare value
   logic                                target_greater_o; ///< Counter greater than compare value
   /// @}


   `uvm_object_utils_begin(uvma_tcounter_b_dpo_seq_item_c)
      `uvm_field_int(counter_value_o, UVM_DEFAULT)
      `uvm_field_int(target_reached_o, UVM_DEFAULT)
      `uvm_field_int(target_greater_o, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvma_tcounter_b_dpo_seq_item");
      super.new(name);
   endfunction

   /**
    * Describes transaction for logger.
    */
   virtual function uvmx_metadata_t get_metadata();
      string counter_value_o_str;
      string target_reached_o_str;
      string target_greater_o_str;
      counter_value_o_str = $sformatf("%h", counter_value_o);
      target_reached_o_str = $sformatf("%b", target_reached_o);
      target_greater_o_str = $sformatf("%b", target_greater_o);
      `uvmx_metadata_field("counter_value_o", counter_value_o_str)
      `uvmx_metadata_field("target_reached_o", target_reached_o_str)
      `uvmx_metadata_field("target_greater_o", target_greater_o_str)
   endfunction

endclass


`endif // __UVMA_TCOUNTER_B_DPO_SEQ_ITEM_SV__