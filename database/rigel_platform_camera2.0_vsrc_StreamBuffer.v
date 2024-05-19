// This program was cloned from: https://github.com/jameshegarty/rigel
// License: MIT License

module StreamBuffer(
    input rst_n,
    input pclk,
    input fclk,

    input start,

    input           din_valid,
    output          din_ready,
    input [7:0]    din,

    output [63:0]   dout,
    output          dout_valid,
    input           dout_ready,
    output          burst_valid,

    output [10:0]   fifo_cnt
);


    reg running;
    `REG(pclk, running, 0, start ? 1 : running)

    wire de2fifo_valid;
    wire de2fifo_ready;
    wire [63:0] de2fifo_data;

    deserializer #(.INLOGBITS(3), .OUTLOGBITS(6)) inst_deserial(
        
        .clk(pclk),
        .rst_n(rst_n),

        .in_valid(din_valid && running),
        .in_ready(din_ready),
        .in_data(din[7:0]),

        .out_valid(de2fifo_valid),
        .out_ready(de2fifo_ready),
        .out_data(de2fifo_data)

    );

    wire vfifo_full;
    wire vfifo_empty;
    wire [8:0] vfifo_count;

    fifo_64w_64r_512d sfifo_inst (
        .rst(!rst_n), // input rst
        .wr_clk(pclk), // input wr_clk
        .rd_clk(fclk), // input rd_clk
        .din(de2fifo_data[63:0]), // input [63 : 0] din
        .wr_en(de2fifo_valid), // input wr_en
        .rd_en(dout_ready), // input rd_en
        .dout(dout), // output [63 : 0] dout
        .full(vfifo_full), // output full
        .empty(vfifo_empty), // output empty
        .rd_data_count(vfifo_count), // output [8 : 0] rd_data_count
        .wr_data_count() // output [8 : 0] wr_data_count
    );
    assign de2fifo_ready = !vfifo_full;
    // I need to guarentee that 16 data entries are read out always
    assign burst_valid = (vfifo_count > 9'd25);
    assign dout_valid = !vfifo_empty;
    assign fifo_cnt = vfifo_count;

endmodule // Conf
