// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// This file contains sample code that demonstrates how to add a new sequence to the CORE-V-MCU Event Interface Agent Self-Test UVM Environment.


`ifndef __UVME__EXAMPLE_SEQ_SV__
`define __UVME__EXAMPLE_SEQ_SV__


/**
 * Example Sequence that generates 10 fully random items by default.
 */
class uvme_cvmcu_event_example_seq_c extends uvme_cvmcu_event_base_seq_c;

   /// @name Knobs
   /// @{
   rand int unsigned  num_items; ///< Number of items to be generated.
   /// @}


   `uvm_object_utils_begin(uvme_cvmcu_event_example_seq_c)
      `uvm_field_int(num_items, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default values for random fields.
    */
   constraint defaults_cons {
      soft num_items == 10;
   }


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_event_example_seq");
      super.new(name);
   endfunction

   /**
    * Generates num_items of fully random items.
    */
   virtual task body();
      for (int unsigned ii=0; ii<num_items; ii++) begin
         `uvm_info("CVMCU_EVENT_EXAMPLE_VSEQ", $sformatf("Starting item %0d/%0d", (ii+1), num_items), UVM_LOW)
         `uvm_do_on_with(req, psequencer.agent_sequencer, {
            // ...
         })
         `uvm_info("CVMCU_EVENT_EXAMPLE_VSEQ", $sformatf("Finished item %0d/%0d", (ii+1), num_items), UVM_MEDIUM)
      end
   endtask

endclass


`endif // __UVME__EXAMPLE_SEQ_SV__