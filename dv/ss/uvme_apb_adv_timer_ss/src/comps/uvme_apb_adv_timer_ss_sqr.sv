// Copyright 2024 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_ADV_TIMER_SS_SQR_SV__
`define __UVME_APB_ADV_TIMER_SS_SQR_SV__


/**
 * Component on which all APB Advanced Timer Sub-System environment (uvme_apb_adv_timer_ss_env_c) Sequences are run.
 * @ingroup uvme_apb_adv_timer_ss_comps
 */
class uvme_apb_adv_timer_ss_sqr_c extends uvmx_ss_env_sqr_c #(
   .T_CFG  (uvme_apb_adv_timer_ss_cfg_c  ),
   .T_CNTXT(uvme_apb_adv_timer_ss_cntxt_c)
);

   /// @name Sequencer handles
   /// @{
   uvma_apb_sqr_c  proc_agent_sequencer; ///< Processor access sequencer
   uvme_adv_timer_b_sqr_c  adv_timer0_b_env_sequencer; ///< Advanced timer 0 sequencer
   uvme_adv_timer_b_sqr_c  adv_timer1_b_env_sequencer; ///< Advanced timer 1 sequencer
   uvme_adv_timer_b_sqr_c  adv_timer2_b_env_sequencer; ///< Advanced timer 2 sequencer
   uvme_adv_timer_b_sqr_c  adv_timer3_b_env_sequencer; ///< Advanced timer 3 sequencer
   /// @}


   `uvm_component_utils(uvme_apb_adv_timer_ss_sqr_c)


   /**
    * Default constructor.
    */
   function new(string name="uvme_apb_adv_timer_ss_sqr", uvm_component parent=null);
      super.new(name, parent);
   endfunction

endclass


`endif // __UVME_APB_ADV_TIMER_SS_SQR_SV__