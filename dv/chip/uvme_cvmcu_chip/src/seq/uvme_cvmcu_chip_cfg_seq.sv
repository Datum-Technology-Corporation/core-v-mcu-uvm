// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_CHIP_CFG_SEQ_SV__
`define __UVME_CVMCU_CHIP_CFG_SEQ_SV__


/**
 * Sets register values to reflect environment configuration.
 * @ingroup uvme_cvmcu_chip_seq
 */
class uvme_cvmcu_chip_cfg_seq_c extends uvme_cvmcu_chip_base_seq_c;

   `uvm_object_utils_begin(uvme_cvmcu_chip_cfg_seq_c)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_chip_cfg_seq");
      super.new(name);
   endfunction

   /**
    * TODO Describe uvme_cvmcu_chip_cfg_seq_c::body()
    */
   virtual task body();
      cfg_uart0();
      cfg_uart1();
   endtask

   /**
    * Assigns UART0 buffer locations and programs registers.
    */
   function void cfg_uart0();
      if (cfg.uart0_agent_cfg.enabled) begin
         cntxt.uart0_rx_buffer_addr = cntxt.malloc(cfg.uart0_rx_buffer_size);
         cntxt.uart0_tx_buffer_addr = cntxt.malloc(cfg.uart0_tx_buffer_size);
         `uvmx_set_field(uart0.rx_saddr.saddr, cntxt.uart0_rx_buffer_addr)
         `uvmx_set_field(uart0.tx_saddr.saddr, cntxt.uart0_tx_buffer_addr)
         `uvmx_set_field(uart0.rx_size .size , cfg  .uart0_rx_buffer_size)
         `uvmx_set_field(uart0.rx_cfg.clear     , 1)
         `uvmx_set_field(uart0.rx_cfg.continuous, 0)
         `uvmx_set_field(uart0.tx_cfg.clr       , 1)
         `uvmx_set_field(uart0.tx_cfg.continuous, 0)
         `uvmx_set_field(uart0.uart_setup.en_rx    , 1)
         `uvmx_set_field(uart0.uart_setup.en_tx    , 1)
         `uvmx_set_field(uart0.irq_en.err_irq_en   , 1)
         `uvmx_set_field(uart0.irq_en.rx_irq_en    , 1)
         `uvmx_set_field(uart0.uart_setup.div      , cfg.sys_clk_frequency/cfg.uart0_agent_cfg.baud_rate)
         `uvmx_set_field(uart0.uart_setup.stop_bits, cfg.uart0_agent_cfg.num_stop_bits-1  )
         `uvmx_set_field(uart0.uart_setup.bits     , cfg.uart0_agent_cfg.frame_size-5     )
         `uvmx_set_field(uart0.uart_setup.parity_en, cfg.uart0_agent_cfg.enable_parity_bit)
         `uvmx_set_field(udma_ctrl.clk_en.uart0, 1)
      end
   endfunction

   /**
    * Assigns UART1 buffer locations and programs registers.
    */
   function void cfg_uart1();
      if (cfg.uart1_agent_cfg.enabled) begin
         cntxt.uart1_rx_buffer_addr = cntxt.malloc(cfg.uart1_rx_buffer_size);
         cntxt.uart1_tx_buffer_addr = cntxt.malloc(cfg.uart1_tx_buffer_size);
         `uvmx_set_field(uart1.rx_saddr.saddr, cntxt.uart1_rx_buffer_addr)
         `uvmx_set_field(uart1.tx_saddr.saddr, cntxt.uart1_tx_buffer_addr)
         `uvmx_set_field(uart1.rx_size .size , cfg  .uart1_rx_buffer_size)
         `uvmx_set_field(uart1.rx_cfg.clear     , 1)
         `uvmx_set_field(uart1.rx_cfg.continuous, 0)
         `uvmx_set_field(uart1.tx_cfg.clr       , 1)
         `uvmx_set_field(uart1.tx_cfg.continuous, 0)
         `uvmx_set_field(uart1.uart_setup.en_rx    , 1)
         `uvmx_set_field(uart1.uart_setup.en_tx    , 1)
         `uvmx_set_field(uart1.irq_en.err_irq_en   , 1)
         `uvmx_set_field(uart1.irq_en.rx_irq_en    , 1)
         `uvmx_set_field(uart1.uart_setup.div      , cfg.sys_clk_frequency/cfg.uart1_agent_cfg.baud_rate)
         `uvmx_set_field(uart1.uart_setup.stop_bits, cfg.uart1_agent_cfg.num_stop_bits-1  )
         `uvmx_set_field(uart1.uart_setup.bits     , cfg.uart1_agent_cfg.frame_size-5     )
         `uvmx_set_field(uart1.uart_setup.parity_en, cfg.uart1_agent_cfg.enable_parity_bit)
         `uvmx_set_field(udma_ctrl.clk_en.uart1, 1)
      end
   endfunction

endclass


`endif // __UVME_CVMCU_CHIP_CFG_SEQ_SV__
