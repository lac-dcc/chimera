
module top(
    input               clk25,

    output [3:0]        leds,

    output              pci_mini_33v_ena,

    input               uart_drv_ena_,
    input               uart_drv_sd_,
    input               uart_txd,
    input               uart_rxd,
    input               uart_rts,
    input               uart_cts,

    input [15:0]        ddr_dq,
    input [1:0]         ddr_dqs,
    input [1:0]         ddr_dm,
    input [12:0]        ddr_a,
    input [1:0]         ddr_ba,
    input               ddr_cas_n,
    input [0:0]         ddr_cke,
    input [0:0]         ddr_cs_n,
    input               ddr_ras_n,
    input               ddr_we_n,
    input [0:0]         clk_to_sdram,
    input [0:0]         clk_to_sdram_n,

    output              pci_xtal,
    input               pci_inta_,
    input               pci_rst_,
    input               pci_clk,
    input               pci_gnt_,
    input               pci_req_,
    input               pci_irdy_,
    input               pci_trdy_,
    input               pci_devsel_,
    input               pci_stop_,
    input               pci_perr_,
    input               pci_serr_ ,

    input [31:0]        pci_ad,
    input [3:0]         pci_cbe_,

    input               pci_frame_,
    input               pci_par,

    input               flash_reset_,

    input               flash_ce_,
    input               flash_oe_,
    input               flash_we_,

    input [20:0]        flash_a,
    input [15:0]        flash_dq,

    output              hwic_3,
    output              hwic_11,
    output              hwic_45,
    output              hwic_12,
    output              hwic_46,
    output              hwic_13,
    output              hwic_47,
    output              hwic_14,
    output              hwic_48,
    output              hwic_15,
    output              hwic_50,
    output              hwic_18,
    output              hwic_52,
    output              hwic_19,
    output              hwic_53,
    output              hwic_20,
    output              hwic_54,
    output              hwic_21,
    output              hwic_55,
    output              hwic_56,
    output              hwic_25,
    input               hwic_32,
    output              hwic_67,

    output [0:0]        misc_outputs
);

    assign pci_mini_33v_ena = 1'b0;
    assign pci_xtal         = cntr[0];

    reg rst_ = 1'b0;
    always @(posedge clk25) begin
        rst_    <= 1'b1;
    end


    reg [24:0] cntr;

    always @(posedge clk25 or negedge rst_) begin
        if (!rst_) begin
            cntr    <= 25'd0;
        end
        else begin
            cntr    <= cntr + 1'b1;
        end
    end

    assign leds[2:0] = cntr[24:22];

    assign leds[3] =
          uart_drv_ena_
        ^ uart_drv_sd_
        ^ uart_txd
        ^ uart_rxd
        ^ uart_rts
        ^ uart_cts

        ^ ^ddr_dq
        ^ ^ddr_dqs
        ^ ^ddr_dm
        ^ ^ddr_a
        ^ ^ddr_ba
        ^ ddr_cas_n
        ^ ddr_cke
        ^ ddr_cs_n
        ^ ddr_ras_n
        ^ ddr_we_n
        ^ clk_to_sdram
        ^ clk_to_sdram_n

        ^ pci_inta_
        ^ pci_rst_
        ^ pci_clk
        ^ pci_gnt_
        ^ pci_req_
        ^ pci_irdy_
        ^ pci_trdy_
        ^ pci_devsel_
        ^ pci_stop_
        ^ pci_perr_
        ^ pci_serr_

        ^ ^pci_ad
        ^ ^pci_cbe_

        ^ pci_frame_
        ^ pci_par

        ^ flash_reset_

        ^ flash_ce_
        ^ flash_oe_
        ^ flash_we_

        ^ ^flash_a
        ^ ^flash_dq;

    //assign misc_outputs = {162{cntr[21]}};
    assign misc_outputs = cntr[23];

    assign hwic_3     = cntr[23];
    assign hwic_11    = cntr[23];
    assign hwic_45    = cntr[23];
    assign hwic_12    = cntr[23];
    assign hwic_46    = cntr[23];
    assign hwic_13    = cntr[23];
    assign hwic_47    = cntr[23];
    assign hwic_14    = cntr[23];
    assign hwic_48    = cntr[23];
    assign hwic_15    = cntr[23];
    assign hwic_50    = cntr[23];
    assign hwic_18    = cntr[23];
    assign hwic_52    = cntr[23];
    assign hwic_19    = cntr[23];
    assign hwic_53    = cntr[23];
    assign hwic_20    = cntr[23];
    assign hwic_54    = cntr[23];
    assign hwic_21    = cntr[23];
    assign hwic_55    = cntr[23];
    assign hwic_56    = cntr[23];
    assign hwic_25    = cntr[23];
    assign hwic_67    = cntr[23];

endmodule
