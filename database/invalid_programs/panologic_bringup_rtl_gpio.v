
`include "top_defines.vh"

`default_nettype none

module gpio
    #(
        parameter NR_GPIOS  = 8
    ) (
        input               clk,
        input               reset_,

        input               mem_cmd_sel,
        input               mem_cmd_valid,
        input               mem_cmd_wr,
        input      [11:0]   mem_cmd_addr,
        input      [31:0]   mem_cmd_wdata,
        output reg [31:0]   mem_rsp_rdata,
        output reg          mem_rsp_ready,

        output reg [NR_GPIOS-1:0]   gpio_oe,
        output reg [NR_GPIOS-1:0]   gpio_do,
        input      [NR_GPIOS-1:0]   gpio_di
    );

    always @(posedge clk) begin
        if (mem_cmd_valid && mem_cmd_sel && mem_cmd_wr) begin
            case({mem_cmd_addr[5:2],2'd0})
                `GPIO_CONFIG_ADDR:   gpio_oe     <= mem_cmd_wdata[NR_GPIOS-1:0];
                `GPIO_DOUT_ADDR:     gpio_do     <= mem_cmd_wdata[NR_GPIOS-1:0];
                `GPIO_DOUT_SET_ADDR: gpio_do     <= gpio_do |  mem_cmd_wdata[NR_GPIOS-1:0];
                `GPIO_DOUT_CLR_ADDR: gpio_do     <= gpio_do & ~mem_cmd_wdata[NR_GPIOS-1:0];
            endcase
        end

        mem_rsp_ready <= 1'b0;
        if (mem_cmd_valid && mem_cmd_sel && !mem_cmd_wr) begin
            case({mem_cmd_addr[5:2],2'd0})
                `GPIO_CONFIG_ADDR: mem_rsp_rdata <= gpio_oe;
                `GPIO_DOUT_ADDR:   mem_rsp_rdata <= gpio_do;
                `GPIO_DIN_ADDR:    mem_rsp_rdata <= gpio_di;
            endcase

            mem_rsp_ready <= 1'b1;
        end
    end

endmodule
