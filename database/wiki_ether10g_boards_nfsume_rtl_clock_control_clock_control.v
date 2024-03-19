//
//-----------------------------------------------------------------------------------------
// Copyright  2011, Xilinx, Inc.
// This file contains confidential and proprietary information of Xilinx, Inc. and is
// protected under U.S. and international copyright and other intellectual property laws.
//-----------------------------------------------------------------------------------------
//
// Disclaimer:
// This disclaimer is not a license and does not grant any rights to the materials
// distributed herewith. Except as otherwise provided in a valid license issued to
// you by Xilinx, and to the maximum extent permitted by applicable law: (1) THESE
// MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL FAULTS, AND XILINX HEREBY
// DISCLAIMS ALL WARRANTIES AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY,
// INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-INFRINGEMENT,
// OR FITNESS FOR ANY PARTICULAR PURPOSE; and (2) Xilinx shall not be liable
// (whether in contract or tort, including negligence, or under any other theory
// of liability) for any loss or damage of any kind or nature related to, arising
// under or in connection with these materials, including for any direct, or any
// indirect, special, incidental, or consequential loss or damage (including loss
// of data, profits, goodwill, or any type of loss or damage suffered as a result
// of any action brought by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-safe, or for use in any
// application requiring fail-safe performance, such as life-support or safety
// devices or systems, Class III medical devices, nuclear facilities, applications
// related to the deployment of airbags, or any other applications that could lead
// to death, personal injury, or severe property or environmental damage
// (individually and collectively, "Critical Applications"). Customer assumes the
// sole risk and liability of any use of Xilinx products in Critical Applications,
// subject only to applicable laws and regulations governing limitations on product
// liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE AT ALL TIMES.
//
//-----------------------------------------------------------------------------------------
//
//
//
//             _ ______ ____ ____ __ __ __
//             | |/ / ___| _ \/ ___|| \/ |/ /_
//             | ' / | | |_) \___ \| |\/| | '_ \
//             | . \ |___| __/ ___) | | | | (_) |
//             |_|\_\____|_| |____/|_| |_|\___/
// 
// 
//
// This module will program the Si5326 clock chip on the KC705 board to produce
// a 156.25 MHz clock.  The input clock to this module must be 100 MHz or the I2C
// design in the Picoblaze module will need to be redesigned.
//-----------------------------------------------------------------------------------------
//
(* CORE_GENERATION_INFO = "clock_control,clock_control_v1_3,{x_ipproduct=Vivado2014.3,v7_xt_conn_trd=2014.3}" *)
module clock_control
   (       
        inout    i2c_clk,
        inout    i2c_data,
        output   i2c_mux_rst_n,
        output   si5324_rst_n,
        input    rst,
        input    clk50
   );

//
//-----------------------------------------------------------------------------------------
//
//-----------------------------------------------------------------------------------------
//
// Signals
//
//-----------------------------------------------------------------------------------------
//
//
// Signals used to connect KCPSM6
//
wire  [11:0]    address;
wire  [17:0]    instruction;
wire            bram_enable;
reg    [7:0]    in_port;
wire   [7:0]    out_port;
wire   [7:0]    port_id;
wire            write_strobe;
wire            k_write_strobe;
wire            read_strobe;
wire            interrupt;
wire            interrupt_ack;
wire            kcpsm6_sleep;
wire            kcpsm6_reset;
wire            rdl;
//
//
//
//
reg            drive_i2c_clk;
reg            drive_i2c_data;

reg            i2c_mux_rst_b_int;
reg            si5324_rst_n_int; 

//-----------------------------------------------------------------------------------------
//
// Start of circuit description
//
//-----------------------------------------------------------------------------------------
//

assign i2c_mux_rst_n = i2c_mux_rst_b_int; // active low reset
assign si5324_rst_n = si5324_rst_n_int;
  //
  //---------------------------------------------------------------------------------------
  // Instantiate KCPSM6 and connect to program ROM
  //---------------------------------------------------------------------------------------
  //
  // The generics can be defined as required. In this case the 'hwbuild' value is used to 
  // define a version using the ASCII code for the desired letter. The interrupt vector 
  // has been set to address 7F0 which would provide 16 instructions to implement an 
  // interrupt service route (ISR) before the end of a 2K program space. Interrupt is not 
  // used in this design at this time but could be exploited in the future.
  //

kcpsm6
  # (   
      .hwbuild                 (12'h041),    // ASCII Character "A"
      .interrupt_vector        (12'h7F0),   
      .scratch_pad_memory_size (64)
     )
  processor 
     (           .address (address),
             .instruction (instruction),
             .bram_enable (bram_enable),
                 .port_id (port_id),
            .write_strobe (write_strobe),
          .k_write_strobe (k_write_strobe),
                .out_port (out_port),
             .read_strobe (read_strobe),
                 .in_port (in_port),
               .interrupt (interrupt),
           .interrupt_ack (interrupt_ack),
                   .sleep (kcpsm6_sleep),
                   .reset (kcpsm6_reset), 
                     .clk (clk50)
     );
 
  assign kcpsm6_reset = rst;
  assign kcpsm6_sleep = 'b0;
  //assign kcpsm6_sleep = write_strobe & k_write_strobe;  // Always '0'
  assign interrupt = interrupt_ack;

  //
  // Program memory up to 4k
  // 

  clock_control_program #(           
                .C_FAMILY ("7S"), 
       .C_RAM_SIZE_KWORDS (2),
    .C_JTAG_LOADER_ENABLE (0))
  program_rom
    (      .address ( address ),      
       .instruction ( instruction ),
            .enable ( bram_enable ),
               .rdl (),
               .clk ( clk50 )
    );
  //
  //---------------------------------------------------------------------------------------
  // Connections to I2C Bus
  //---------------------------------------------------------------------------------------
  //
  // The data and clock should be treated as open collector bidirectional signals which 
  // use a pull-up on the board to generate a High level.
  //

  assign i2c_clk  = (drive_i2c_clk == 1'b0) ? 1'b0 : 1'bz;
  assign i2c_data = (drive_i2c_data == 1'b0) ? 1'b0 : 1'bz;


  //
  //---------------------------------------------------------------------------------------
  // General Purpose Output Ports 
  //---------------------------------------------------------------------------------------
  //
  // Output ports must capture the value presented on the 'out_port' based on the value of 
  // 'port_id' when 'write_strobe' is High.
  //

  always @(posedge clk50)
  begin
      // 'write_strobe' is used to qualify all writes to general output ports.
      if (write_strobe == 1'b1) begin

        // Write to status bits at port address 04 hex
        if (port_id[2] == 1'b1) begin
          i2c_mux_rst_b_int <= out_port[0];
          si5324_rst_n_int <= out_port[1];
        end
        // Write to I2C Bus at port address 08 hex
        if (port_id[3] == 1'b1) begin
          drive_i2c_clk <= out_port[0];
          drive_i2c_data <= out_port[1];
        end
     end // if (write_strobe == 1'b1)
  end

  //
  //---------------------------------------------------------------------------------------
  // General Purpose Input Ports. 
  //---------------------------------------------------------------------------------------
  //

  always @(posedge clk50)
  begin

      case (port_id[2:0])

        // Read I2C Bus at port address 06 hex
        3'b110 :  begin
                    in_port[0] <= i2c_clk;
                    in_port[1] <= i2c_data;
                  end         
        default :   in_port <= 'b0;
      
      endcase
    end

endmodule
//-----------------------------------------------------------------------------------------
//
// END OF FILE clock_control.v
//
//-----------------------------------------------------------------------------------------

