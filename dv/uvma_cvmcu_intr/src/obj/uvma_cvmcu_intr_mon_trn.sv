// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_INTR_MON_TRN_SV__
`define __UVMA_CVMCU_INTR_MON_TRN_SV__


/**
 * Object rebuilt by monitor (uvma_cvmcu_intr_mon_c).  Analog of uvma_cvmcu_intr_seq_item_c.
 */
class uvma_cvmcu_intr_mon_trn_c extends uvml_mon_trn_c;

   /// @defgroup Data
   /// @{
   // TODO Add uvma_cvmcu_intr_mon_trn_c data fields
   //      Ex: logic [7:0]  xyz; ///< Describe abc here
   /// @}

   /// @defgroup Metadata
   /// @{
   uvma_cvmcu_intr_cfg_c  cfg; ///< Agent configuration handle
   /// @}


   `uvm_object_utils_begin(uvma_cvmcu_intr_mon_trn_c)
      // TODO Add UVM field utils for data fields
      //      Ex: `uvm_field_int(abc, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   extern function new(string name="uvma_cvmcu_intr_mon_trn");

   /**
    * Describes transaction as metadata for uvml_logs_metadata_logger_c.
    */
   extern function uvml_metadata_t get_metadata();

endclass : uvma_cvmcu_intr_mon_trn_c


function uvma_cvmcu_intr_mon_trn_c::new(string name="uvma_cvmcu_intr_mon_trn");

   super.new(name);

endfunction : new


function uvml_metadata_t uvma_cvmcu_intr_mon_trn_c::get_metadata();

   // TODO Create metadata for transaction logger
   //      Ex: string  abc_str = $sformatf("%h", abc);
   //          get_metadata.push_back('{
   //             index     : 0,
   //             value     : abc_str
   //             col_name  : "abc",
   //             col_width : abc_str.len(),
   //             col_align : UVML_TEXT_ALIGN_RIGHT,
   //             data_type : UVML_FIELD_INT
   //          });

endfunction : get_metadata


`endif // __UVMA_CVMCU_INTR_MON_TRN_SV__
