module interrupt_controller (
    /*autoport*/
//output
            APB_pready,
            APB_prdata,
            APB_pslverr,
            irq_level,
//input
            clk,
            rst_n,
            APB_paddr,
            APB_psel,
            APB_penable,
            APB_pwrite,
            APB_pwdata,
            rising_irq_in);

input wire clk;    // Clock
input wire rst_n;  // Asynchronous reset active low

input  wire [31:0] APB_paddr;
input  wire        APB_psel;
input  wire        APB_penable;
input  wire        APB_pwrite;
input  wire [31:0] APB_pwdata;
output wire        APB_pready;
output wire [31:0] APB_prdata;
output wire        APB_pslverr;

output wire irq_level;
input wire[31:0] rising_irq_in;

wire write_issue;

assign write_issue = APB_pwrite & APB_penable;
assign APB_pslverr = 1'b0;
assign APB_pready = APB_penable;

gpio_altr_rising_to_level ctl_core(
    .irq       (irq),
    .readdata  (APB_prdata),
    .address   (APB_paddr[3:2]),
    .chipselect(APB_psel),
    .in_port   (rising_irq_in),
    .write_n   (~write_issue),
    .writedata (APB_pwdata),
    .reset_n   (reset_n),
    .clk       (clk)
);


endmodule