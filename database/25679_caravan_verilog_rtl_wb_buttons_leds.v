// This program was cloned from: https://github.com/Jonathan684/caravan
// License: Apache License 2.0

/*
    based off https://zipcpu.com/zipcpu/2017/05/29/simple-wishbone.html

    copyright Matt Venn 2020

    licensed under the GPL
*/
`default_nettype none

module wb_buttons_leds #(
    parameter   [31:0]  BASE_ADDRESS    = 32'h3000_0000,        // base address
    parameter   [31:0]  LED_ADDRESS     = BASE_ADDRESS,
    parameter   [31:0]  BUTTON_ADDRESS  = BASE_ADDRESS + 4
    ) (
`ifdef USE_POWER_PINS
    // inout vdda1,	// User area 1 3.3V supply
    // inout vdda2,	// User area 2 3.3V supply
    // inout vssa1,	// User area 1 analog ground
    // inout vssa2,	// User area 2 analog ground
    inout vccd1,	// User area 1 1.8V supply
    //inout vccd2,	// User area 2 1.8v supply
    inout vssd1,	// User area 1 digital ground
    //inout vssd2,	// User area 2 digital ground
`endif
    input wire          wb_clk_i,
    input wire          wb_rst_i,

    // wb interface
    input wire          wbs_cyc_i,       // wishbone transaction
    input wire          wbs_stb_i,       // strobe - data valid and accepted as long as !o_wb_stall
    input wire          wbs_we_i,        // write enable
    input wire  [31:0]  wbs_adr_i,      // address
    input wire  [31:0]  wbs_dat_i,      // incoming data
    output reg          wbs_ack_o,       // request is completed 
    //output wire         o_wb_stall,     // cannot accept req
    output reg  [31:0]  wbs_dat_o,      // output data

    // buttons
    input wire  [2:0]   buttons,
    output reg  [7:0]   leds,
    output wire [7:0]   led_enb        // not enable - low for active
    
    );

    assign led_enb = 8'b0; // always enabled

    initial leds = 8'b0;

    // writes
    always @(posedge wb_clk_i) begin
        if(wb_rst_i)
            leds <= 8'b0;
        else if(wbs_stb_i && wbs_cyc_i && wbs_we_i && wbs_adr_i == LED_ADDRESS) begin
            leds <= wbs_dat_i[7:0];
        end
    end

    // reads
    always @(posedge wb_clk_i) begin
        if(wbs_stb_i && wbs_cyc_i && !wbs_we_i)
            case(wbs_adr_i)
                LED_ADDRESS: 
                    wbs_dat_o <= {24'b0, leds};
                BUTTON_ADDRESS: 
                    wbs_dat_o <= {29'b0, buttons};
                default:
                    wbs_dat_o <= 32'b0;
            endcase
    end

    // acks
    always @(posedge wb_clk_i) begin
        if(wb_rst_i)
            wbs_ack_o <= 0;
        else
            // return ack immediately
            wbs_ack_o <= (wbs_stb_i && (wbs_adr_i == LED_ADDRESS || wbs_adr_i == BUTTON_ADDRESS));
    end

endmodule
