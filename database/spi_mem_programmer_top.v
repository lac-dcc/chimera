// This program was cloned from: https://github.com/sergachev/spi_mem_programmer
// License: MIT License

`timescale 1ns / 1ps

`include "defs.vh"

// In a simulation reset comes from the testbench and clk_to_mem_out has to be connected
//  to the SPI memory model in the testbench.
// In hardware, if the FPGA SPI boot memory is used, the memory clock has to be connected
//  via STARTUPE2 and end_of_startup can be used as a reset.

module top (
    input CLK_100M,
    output reg [1:0] status_led,

`ifndef  __SYNTHESIS__
    output clk_to_mem_out,
    input rst,
`endif
    inout [3:0] DQio,
    output S
    );
   
    wire clk_to_mem, clk;
    wire end_of_startup;

`ifndef  __SYNTHESIS__
    assign clk_to_mem_out = clk_to_mem;
`else 
    wire rst = ~end_of_startup;
`endif

    wire [7:0] readout;
    wire busy;
    wire error;
    reg trigger;
    reg quad_mode;
    reg [7:0] cmd;
    reg [(3+256)*8-1:0] data_send;
    reg [4:0] state;
    
    clk_for_spi clk_spi_inst (
       .clk_in1(CLK_100M),      // input clk_in1, 100 MHz
       .clk_out1(clk),          // output clk_out1, 40 MHz, 0 deg
       .clk_out2(clk_to_mem),   // output clk_out2, 40 MHz, 180 deg
       .reset(rst)
    );      

    STARTUPE2 #(
       .PROG_USR("FALSE"),
       .SIM_CCLK_FREQ(10.0)
    ) STARTUPE2_inst (
        .CFGCLK(),
        .CFGMCLK(),
        .EOS(end_of_startup),
        .PREQ(),
        .CLK(1'b0),
        .GSR(1'b0),
        .GTS(1'b0),
        .KEYCLEARB(1'b0),
        .PACK(1'b0),
        .USRCCLKO(clk_to_mem),
        .USRCCLKTS(1'b0),
        .USRDONEO(1'b1),
        .USRDONETS(1'b1)
    );
 
    qspi_mem_controller mc(
        .clk(clk), 
        .reset(rst),
        .S(S), 
        .DQio(DQio),
        .trigger(trigger),
        .quad_mode(quad_mode),
        .cmd(cmd),
        .data_send(data_send),
        .readout(readout),
        .busy(busy),
        .error(error)
    );

    always @(posedge clk) begin
        if (rst) begin
            trigger <= 0;
            state <= 0;
            status_led <= 0;
            quad_mode <= 0;
        end else begin
            case(state)
                0: begin
                    if (!busy)
                        state <= state+1;
                end
                
                1: begin    // read memory ID to test the communication
                    cmd <= `CMD_RDID;
                    trigger <= 1;   
                    state <= state+1;                    
                end
                
                2: begin
                    if (trigger)
                        trigger <= 0;
                    else if (!busy) begin
                        $display("mem id: %x", readout);
                        if (readout == `JEDEC_ID) begin // verify the memory ID read
                            status_led[1] <= 1;
                            // enable quad IO
                            cmd <= `CMD_WRVECR;
                            data_send[7:0] <= 8'b010_01_111;  // quad protocol, hold/accelerator disabled, default drive strength
                            trigger <= 1;   
                            state <= state+1;    
                        end else begin
                            status_led[0] <= 1; // memory ID is wrong, error, finish
                        end
                    end
                end
                
                3: begin
                    if (trigger) begin
                        trigger <= 0;
                    end else if (!busy) begin
                        quad_mode <= 1;
                        cmd <= `CMD_WREN;
                        trigger <= 1;
                        state <= state+1;
                    end
                end

                4: begin
                    if (trigger)
                        trigger <= 0;
                    else if (!busy) begin
                        cmd <= `CMD_PP;
                         // 3 bytes of address, then random data
                        data_send <= {24'hA30000, 2048'h01020304057372f04a39e4d37746533f26c5e18660ac4f512a18faef74279aae5f886745368ff4bdc0505deeb822c1c2a0ac568c4c11b41a9f62f93492cdbdb2a2b57f16c173a319879b8e45baee122f7c5821445ae1ad29f7e2655ac509ca8b450d453638de42e853adb1fbbcc9bac5f7f35b16346431aa0ac6f4865abaa74859cdf4d94c46b40efabe211621515d5dc2d383debab44cdbd57c41b37c34d6466f15cf7e36b481e104bf0367d7f7393fe2e62f489e8c9f6c522ec842789e8b6d251d35cb938664fda91a44de72227f9d748dacc21bc0e5ad5df3458e8f3b023e4e53cb4b266d0fb495aaeae3a56f04f9a1117409992975c4b4a5a88048edee5d};
                        trigger <= 1;
                        state <= state+1;
                    end
                end

                5: begin
                    trigger <= 0;
                    if (!busy && !trigger) begin
                        status_led[0] <= 1;
                        status_led[1] <= ~error;
                    end
                end
                
                default:
                    state <= state+1;
            endcase
        end
    end

endmodule
