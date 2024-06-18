// This program was cloned from: https://github.com/3b3al-MV/PIT-source-codes-for-ASIC-projects
// License: MIT License

module pit_regs #(parameter ARST_LVL = 1'b0,  // asynchronous reset level
                  parameter COUNT_SIZE = 16,
                  parameter NO_PRESCALE = 1'b0,
                  parameter DWIDTH = 16)
  (
  output reg [COUNT_SIZE-1:0] mod_value,    // Main Counter Modulo Value
  output               [ 3:0] pit_pre_scl,  // PIT Prescaler Value
  output reg                  pit_slave,    // PIT Slave Mode
  output reg                  pit_flg_clr,  // Clear PIT Rollover Flag
  output reg                  pit_ien,      // PIT Interrupt Enable
  output reg                  cnt_sync_o,   // PIT Counter Enable
  output reg                  pit_irq_o,    // PIT interrupt
  input                       bus_clk,      // Control register bus clock
  input                       async_rst_b,  // Async reset signal
  input                       sync_reset,   // Syncronous reset signal
  input                       pit_flag,     // PIT Rollover Flag
  input          [DWIDTH-1:0] write_bus,    // Write Data Bus
  input                [ 3:0] write_regs,   // Write Register strobes
  input                       cnt_flag_o    // Counter Rollover Flag 
  );


  // registers
  reg  [ 3:0] pit_pre;    // Optional register for PIT Prescale Counter modulo
                          //  This register should be removed during synthesis
			  //  if the "NO_PRESCALE" parameter is set

  // Wires
	wire [15:0] write_data; // Data bus mux for 8 or 16-bit module bus

  //
  // module body
  //
  
  assign write_data = (DWIDTH == 8) ? {write_bus[7:0], write_bus[7:0]} : write_bus;
  
  assign pit_pre_scl = NO_PRESCALE ? 4'b0 : pit_pre;

  // generate wishbone write registers
  always @(posedge bus_clk or negedge async_rst_b)
    if (!async_rst_b)
      begin
        pit_slave   <= 1'b0;
        pit_pre     <= 4'b0;
        pit_flg_clr <= 1'b0;
        pit_ien     <= 1'b0;
        cnt_sync_o  <= 1'b0;
        mod_value   <= 0;
       end
    else if (sync_reset)
      begin
        pit_slave   <= 1'b0;
        pit_pre     <= 4'b0;
        pit_flg_clr <= 1'b0;
        pit_ien     <= 1'b0;
        cnt_sync_o  <= 1'b0;
        mod_value   <= 0;
      end
    else
      case (write_regs) // synopsys parallel_case
         4'b0011 :
           begin
             pit_slave   <= write_data[15];
             pit_pre     <= write_data[11:8];
             pit_flg_clr <= write_data[2];
             pit_ien     <= write_data[1];
             cnt_sync_o  <= write_data[0];
           end
         4'b0001 :
           begin
             pit_flg_clr <= write_data[2];
             pit_ien     <= write_data[1];
             cnt_sync_o  <= write_data[0];
           end
         4'b0010 :
           begin
             pit_slave   <= write_data[7];
             pit_pre     <= write_data[3:0];
           end
         4'b1100 : mod_value        <= write_data;
         4'b0100 : mod_value[ 7:0]  <= write_data[7:0];
         4'b1000 : mod_value[15:8]  <= write_data[7:0];
         default:
           pit_flg_clr <= 1'b0;
      endcase

  // generate interrupt request signals
  always @(posedge bus_clk or negedge async_rst_b)
    if (!async_rst_b)
      pit_irq_o <= 0;
    else if (sync_reset)
      pit_irq_o <= 0;
    else
      pit_irq_o <= cnt_flag_o && pit_ien; // interrupt signal is only generated
                                          //  when IEN (interrupt enable bit is set)


endmodule  // pit_regs
