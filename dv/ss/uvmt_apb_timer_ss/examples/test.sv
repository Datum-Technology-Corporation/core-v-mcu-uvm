// Copyright 2024 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// This file contains sample code that demonstrates how to add a new test to the APB simple timer unit Sub-System Test Bench and UVM Test Library.


`ifndef __UVMT_APB_TIMER_SS_EXAMPLE_TEST_SV__
`define __UVMT_APB_TIMER_SS_EXAMPLE_TEST_SV__


/**
 * Test which runs Sequence 'example_seq' for 100 items of stimulus.
 */
class uvmt_apb_timer_ss_example_test_c extends uvmt_apb_timer_ss_base_test_c;

   rand uvme_apb_timer_ss_example_seq_c  example_seq; ///< Virtual sequence run during main_phase.


   `uvm_component_utils(uvmt_apb_timer_ss_example_test_c)


   /**
    * Rules for this test.
    */
   constraint example_test_cons {
      example_seq.num_items == 100;
   }


   /**
    * Default constructor.
    */
   function new(string name="uvmt_apb_timer_ss_example_test", uvm_component parent=null);
      super.new(name, parent);
   endfunction


   /**
    * Creates example_seq.
    */
   virtual function void create_sequences();
      example_seq = uvme_apb_timer_ss_example_seq_c::type_id::create("example_seq");
   endfunction

   /**
    * Runs example_seq on sequencer.
    */
   virtual task main_phase(uvm_phase phase);
      phase.raise_objection(this);
      `uvm_info("TEST", $sformatf("Starting 'example_seq':\n%s", example_seq.sprint()), UVM_NONE)
      example_seq.start(sequencer);
      `uvm_info("TEST", $sformatf("Finished 'example_seq':\n%s", example_seq.sprint()), UVM_NONE)
      phase.drop_objection(this);
   endtask

   /**
    * Ensures that items were generated and that the scoreboard saw the same number of matches.
    */
   virtual function void check_phase(uvm_phase phase);
      if (example_seq.num_items == 0) begin
         `uvm_error("TEST", "No items were generated")
      end
      if (example_seq.num_items != env_cntxt.sb_cntxt.match_count) begin
         `uvm_error("TEST", $sformatf("Number of items driven in (%0d) and number of scoreboard matches (%0d) do not match", example_seq.num_items, env_cntxt.sb_cntxt.match_count))
      end
   endfunction

   /**
    * Prints end-of-test goals report.
    */
   virtual function void report_phase(uvm_phase phase);
      `uvmx_test_report(
         $sformatf("%0d sequence items were generated", example_seq.num_items),
         $sformatf("Scoreboard saw %0d matches"       , env_cntxt.sb_cntxt.match_count),
      )
   endfunction

endclass


`endif // __UVMT_APB_TIMER_SS_EXAMPLE_TEST_SV__