// This program was cloned from: https://github.com/pmezydlo/BeagleWire
// License: GNU General Public License v2.0

module top (input         clk,
            inout  [15:0] gpmc_ad,
            input         gpmc_advn,
            input         gpmc_csn1,
            input         gpmc_wein,
            input         gpmc_oen,
            input         gpmc_clk,

            inout [7:0]   pmod1,
            inout [7:0]   pmod2,
            inout [7:0]   pmod3,
            inout [7:0]   pmod4,
            inout [7:0]   sw_btn_led,
            inout [7:0]   gr);

parameter ADDR_WIDTH = 5;
parameter DATA_WIDTH = 16;
parameter RAM_DEPTH = 1 << ADDR_WIDTH;

reg [DATA_WIDTH-1:0] mem [0:RAM_DEPTH];

reg oe;
reg we;
reg cs;
wire[ADDR_WIDTH-1:0]  addr;
reg [DATA_WIDTH-1:0]  data_out;
wire [DATA_WIDTH-1:0]  data_in;

wire [47:0] dir;
wire [47:0] Inputs;
wire [47:0] Outputs;

always @ (posedge clk)
begin
    if (!cs && !we && oe) begin
        mem[addr] <= data_out;
    end
end

always @ (posedge clk)
begin
    if (!cs && we && !oe) begin
        mem[0] <= Inputs[15:0];
        mem[9] <= Inputs[31:16];
        mem[10] <= Inputs[47:32];
        data_in <= mem[addr];
    end else begin
        data_in <= 0;
    end
end

gpmc_sync #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH))
gpmc_controller (
    .clk(clk),

    .gpmc_ad(gpmc_ad),
    .gpmc_advn(gpmc_advn),
    .gpmc_csn1(gpmc_csn1),
    .gpmc_wein(gpmc_wein),
    .gpmc_oen(gpmc_oen),
    .gpmc_clk(gpmc_clk),

    .oe(oe),
    .we(we),
    .cs(cs),
    .address(addr),
    .data_out(data_out),
    .data_in(data_in),
);

assign dir[15:0] = mem[0];
assign dir[31:16] = mem[1];
assign dir[47:32] = mem[2];
assign Outputs[15:0] = mem[4];
assign Outputs[31:16] = mem[5];
assign Outputs[47:32] = mem[6];

gpio_port port1 (
    .io(pmod1),
    .dir(dir[7:0]),
    .Input(Inputs[7:0]),
    .Output(Outputs[7:0]),
);

gpio_port port2 (
    .io(pmod2),
    .dir(dir[15:8]),
    .Input(Inputs[15:8]),
    .Output(Outputs[15:8]),
);

gpio_port port3 (
    .io(pmod3),
    .dir(dir[23:16]),
    .Input(Inputs[23:16]),
    .Output(Outputs[23:16]),
);

gpio_port port4 (
    .io(pmod4),
    .dir(dir[31:24]),
    .Input(Inputs[31:24]),
    .Output(Outputs[31:24]),
);

gpio_port port5 (
    .io(gr),
    .dir(dir[39:32]),
    .Input(Inputs[39:32]),
    .Output(Outputs[39:32]),
);

gpio_port port6 (
    .io(sw_btn_led),
    .dir(dir[47:40]),
    .Input(Inputs[47:40]),
    .Output(Outputs[47:40]),
);

endmodule
