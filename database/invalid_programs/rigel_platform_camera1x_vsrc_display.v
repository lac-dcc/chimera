module display(
  
    input fclk,
    input rst_n,
    input vgaclk,

    input [31:0] vga_cmd,
    input vga_cmd_valid,
    output vga_cmd_ready,

    output reg VGA_VS_n,
    output reg VGA_HS_n,
    output reg [7:0] VGA_red,
    output reg [7:0] VGA_green,
    output reg [7:0] VGA_blue,

    output reg pvalid,

    output [7:0] debug,

    output sdata_burst_ready,
    input sdata_valid,
    output sdata_ready,
    input [63:0] sdata


);
    
    assign sdata_ready = 1'b1;
    
    wire fifo2se_valid;
    wire fifo2se_ready;
    wire [63:0] fifo2se_data;

    
    wire fifo_full;
    wire fifo_empty;
    
    // Magic number 450 is just a number less than 512-16
    // This is required so that there is enough room in the fifo for the axi burst
    wire [8:0] rd_data_count;
    wire [8:0] wr_data_count;
    assign sdata_burst_ready = (wr_data_count[8:0] < (9'd450));

    fifo_64w_64r_512d vgafifo (
          .rst(!rst_n), // input rst
          .wr_clk(fclk), // input wr_clk
          .rd_clk(vgaclk), // input rd_clk
          .din(sdata[63:0]), // input [63 : 0] din
          .wr_en(sdata_valid), // input wr_en
          .rd_en(fifo2se_ready), // input rd_en
          .dout(fifo2se_data), // output [63 : 0] dout
          .full(fifo_full), // output full
          .empty(fifo_empty), // output empty
          .rd_data_count(rd_data_count[8:0]), // output [8 : 0] rd_data_count
          .wr_data_count(wr_data_count[8:0]) // output [8 : 0] wr_data_count
    );

    assign fifo2se_valid = !fifo_empty;

    wire pixel_valid;
    wire pixel_ready;
    wire [31:0] pixel_data;
    serializer #(.INLOGBITS(6), .OUTLOGBITS(5)) inst_serial(
        
        .clk(vgaclk),
        .rst_n(rst_n),

        .in_valid(fifo2se_valid),
        .in_ready(fifo2se_ready),
        .in_data(fifo2se_data[63:0]),

        .out_valid(pixel_valid),
        .out_ready(pixel_ready),
        .out_data(pixel_data[31:0])

    );
   
    reg fifo_full_err;
    `REG_ERR(fclk, fifo_full_err, fifo_full)
    
    wire [31:0] vga_cmd_out;
    wire vga_cmd_empty;
    wire vga_cmd_fifo;
    assign vga_cmd_ready = !vga_cmd_full;
    
    cfifo32x16 cfifo (
        .rst(!rst_n), // input rst
        .wr_clk(fclk), // input wr_clk
        .rd_clk(vgaclk), // input rd_clk
        .din(vga_cmd), // input [31 : 0] din
        .wr_en(vga_cmd_valid), // input wr_en
        .rd_en(!vga_cmd_empty), // input rd_en
        .dout(vga_cmd_out), // output [31 : 0] dout
        .full(vga_cmd_full), // output full
        .empty(vga_cmd_empty) // output empty
    );
    
    //in vgaclk domain
    wire vga_start;
    wire vga_stop;
    assign vga_start = !vga_cmd_empty && (vga_cmd_out == `CMD_START); //pulse    
    assign vga_stop = !vga_cmd_empty && (vga_cmd_out == `CMD_STOP); //pulse    
    
    reg saw_vga_start;
    `REG(vgaclk, saw_vga_start, 1'b0, vga_start ? 1'b1 : vga_running ? 1'b0 : saw_vga_start)
    reg vga_stopping;
    `REG(vgaclk, vga_stopping, 1'b0, vga_stop ? 1'b1 : vga_stopping)

    wire [9:0] vga_row;
    wire [9:0] vga_col;
    wire vstart;
    wire hstart;
    assign vstart = pixel_valid && (vga_row == 10'h0);
    assign hstart = pixel_valid && (vga_col == 10'h0);
    
    reg vga_running;
    wire vga_running_nxt;
    assign vga_running_nxt = ((rd_data_count[8:0] > 9'd250) && saw_vga_start && vstart && hstart) ? 1'b1 : vga_running;
    `REG(vgaclk, vga_running, 1'b0, vga_running_nxt)

    assign debug[7:0] = {4'b0,pixel_ready, saw_vga_start, vga_running, vga_stopping};

    wire HS_n;
    wire VS_n;
    wire [7:0] VGA_red_nxt;
    wire [7:0] VGA_green_nxt;
    wire [7:0] VGA_blue_nxt;
    
    VGATiming vga_timing(
        .clk_25M(vgaclk),
        .rst_n(rst_n),
        .HS_n(HS_n),
        .VS_n(VS_n),
        .pixel_valid(vga_pixel_valid),
        .vga_row(vga_row),
        .vga_col(vga_col)
    );

    //flop all the vga signals
    `REG(vgaclk, VGA_VS_n, 1'b0, VS_n)
    `REG(vgaclk, VGA_HS_n, 1'b0, HS_n)
    `REG(vgaclk, VGA_red[7:0], 8'hFF, VGA_red_nxt[7:0])
    `REG(vgaclk, VGA_green[7:0], 8'hFF, VGA_green_nxt[7:0])
    `REG(vgaclk, VGA_blue[7:0], 8'hFF, VGA_blue_nxt[7:0])
    `REG(vgaclk, pvalid, 1'b0, vga_pixel_valid)
    
    wire [7:0] pattern_red;
    wire [7:0] pattern_green;
    wire [7:0] pattern_blue;

    // Need to read a cycle early in order to flop the data
    assign pixel_ready = !vga_stopping && vga_running_nxt && vga_pixel_valid;
    assign VGA_red_nxt = pixel_ready ? pixel_data[7:0] : pattern_red[7:0];
    assign VGA_green_nxt = pixel_ready ? pixel_data[15:8] : pattern_green[7:0];
    assign VGA_blue_nxt = pixel_ready ? pixel_data[23:16] : pattern_blue[7:0];

    assign pattern_red = (vga_col <=210) ? 8'hFF : 8'h0;
    assign pattern_green = ((vga_col >210) && (vga_col <= 420)) ? 8'hFF : 8'h0;
    assign pattern_blue = (vga_col >420) ? 8'hFF : 8'h0;


endmodule : display
