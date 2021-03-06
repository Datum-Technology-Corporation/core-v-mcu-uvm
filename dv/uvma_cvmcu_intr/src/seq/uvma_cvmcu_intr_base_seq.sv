// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_INTR_BASE_SEQ_SV__
`define __UVMA_CVMCU_INTR_BASE_SEQ_SV__


/**
 * Abstract object from which all other CORE-V MCU Interrupt agent sequences must extend.
 * Subclasses must be run on CORE-V MCU Interrupt sequencer (uvma_cvmcu_intr_sqr_c) instance.
 */
class uvma_cvmcu_intr_base_seq_c extends uvml_seq_c #(
   .REQ(uvma_cvmcu_intr_seq_item_c),
   .RSP(uvma_cvmcu_intr_seq_item_c)
);

   /// @defgroup Objects
   /// @{
   uvma_cvmcu_intr_cfg_c    cfg  ; ///< Agent configuration handle
   uvma_cvmcu_intr_cntxt_c  cntxt; ///< Agent context handle
   /// @}


   `uvm_object_utils(uvma_cvmcu_intr_base_seq_c)
   `uvm_declare_p_sequencer(uvma_cvmcu_intr_sqr_c)


   /**
    * Default constructor.
    */
   extern function new(string name="uvma_cvmcu_intr_base_seq");

   /**
    * Assigns cfg and cntxt handles from p_sequencer.
    */
   extern virtual task pre_start();

endclass : uvma_cvmcu_intr_base_seq_c


function uvma_cvmcu_intr_base_seq_c::new(string name="uvma_cvmcu_intr_base_seq");

   super.new(name);

endfunction : new


task uvma_cvmcu_intr_base_seq_c::pre_start();

   cfg   = p_sequencer.cfg;
   cntxt = p_sequencer.cntxt;

endtask : pre_start


`endif // __UVMA_CVMCU_INTR_BASE_SEQ_SV__
