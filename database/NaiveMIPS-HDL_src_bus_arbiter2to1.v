`define INST_SRAM_MASK     32'hfff0_0000
`define INST_SRAM_WINDOW   32'h1fc0_0000
`define DATA_SRAM_MASK     32'hfff0_0000
`define DATA_SRAM_WINDOW   32'h0000_0000

module arbiter2to1 (
/*autoport*/
//output
            ibus_rddata,
            ibus_stall,
            dbus_rddata,
            dbus_stall,
            inst_cen,
            inst_wen,
            inst_addr,
            inst_din,
            data_cen,
            data_wen,
            data_addr,
            data_din,
            htrans,
            hsize,
            haddr,
            hwrite,
            hwdata,
            hburst,
            hmastlock,
            hprot,
            hsel,
//input
            clk,
            rst_n,
            ibus_dataenable,
            ibus_rd,
            ibus_wr,
            ibus_address,
            ibus_wrdata,
            dbus_dataenable,
            dbus_rd,
            dbus_wr,
            dbus_address,
            dbus_wrdata,
            inst_dout,
            data_dout,
            hrdata,
            hreadyout,
            hresp);

parameter EN_BRAM_IF = 0;

input wire clk;
input wire rst_n;

//ibus to CPU
input wire[3:0] ibus_dataenable;
input wire ibus_rd;
input wire ibus_wr;
input wire[31:0] ibus_address;
input wire[31:0] ibus_wrdata;
output reg[31:0] ibus_rddata;
output reg ibus_stall;
//dbus to CPU
input wire[3:0] dbus_dataenable;
input wire dbus_rd;
input wire dbus_wr;
input wire[31:0] dbus_address;
input wire[31:0] dbus_wrdata;
output reg[31:0] dbus_rddata;
output reg dbus_stall;
//inst block ram
output wire       inst_cen;
output wire[3 :0] inst_wen;
output wire[31:0] inst_addr;
output wire[31:0] inst_din;
input  wire[31:0] inst_dout;
//data block ram
output wire       data_cen;
output wire[3 :0] data_wen;
output wire[31:0] data_addr;
output wire[31:0] data_din;
input  wire[31:0] data_dout;
//AHB
output wire[1 :0] htrans;
output wire[2 :0] hsize;
output wire[31:0] haddr;
output wire       hwrite;
output wire[31:0] hwdata;
output wire[2 :0] hburst;
output wire       hmastlock;
output wire[3 :0] hprot;
output wire       hsel;
input  wire[31:0] hrdata;
input  wire       hreadyout;
input  wire       hresp;

wire bram_i_sel,bram_d_sel;
wire bram_i_stall,bram_d_stall;
reg bram_i_1st_cycle,bram_d_1st_cycle;
wire ahb_i_sel,ahb_d_sel;

reg arbiter_i_act, arbiter_d_act;

reg[3:0]  ahb_dataenable;
reg       ahb_rd;
reg       ahb_wr;
reg[31:0] ahb_address;
reg[31:0] ahb_wrdata;
wire[31:0]ahb_rddata;
wire      ahb_stall;

ahb_adapter adapter(
    .dataenable    (ahb_dataenable),
    .rd            (ahb_rd),
    .wr            (ahb_wr),
    .address       (ahb_address),
    .wrdata        (ahb_wrdata),
    .rddata        (ahb_rddata),
    .stall         (ahb_stall),
    .AHB_hrdata    (hrdata),
    .AHB_hready_out(hreadyout),
    .AHB_hresp     (hresp),
    .AHB_haddr     (haddr),
    .AHB_hburst    (hburst),
    .AHB_hprot     (hprot),
    .AHB_hready_in (),
    .AHB_hsize     (hsize),
    .AHB_htrans    (htrans),
    .AHB_hwdata    (hwdata),
    .AHB_hwrite    (hwrite),
    .AHB_sel       (hsel),
    .triple_byte_w (),
    .rst_n         (rst_n),
    .clk           (clk)
);

generate
    if(EN_BRAM_IF) begin 
        assign bram_i_sel = (ibus_address & `INST_SRAM_MASK) == `INST_SRAM_WINDOW;
        assign bram_d_sel = (dbus_address & `DATA_SRAM_MASK) == `DATA_SRAM_WINDOW;
    end else begin 
        assign bram_i_sel = 1'b0;
        assign bram_d_sel = 1'b0;
    end
endgenerate

assign bram_i_stall = (ibus_rd|ibus_wr) & bram_i_1st_cycle;
assign bram_d_stall = (dbus_rd|dbus_wr) & bram_d_1st_cycle;

assign ahb_i_sel = (ibus_rd|ibus_wr) & ~bram_i_sel;
assign ahb_d_sel = (dbus_rd|dbus_wr) & ~bram_d_sel;

assign inst_addr = ibus_address & ~(32'b11);
assign data_addr = dbus_address & ~(32'b11);
assign inst_din = ibus_wrdata;
assign data_din = dbus_wrdata;
assign inst_cen = bram_i_sel;
assign data_cen = bram_d_sel;
assign inst_wen = ibus_wr ? ibus_dataenable : 4'h0;
assign data_wen = dbus_wr ? dbus_dataenable : 4'h0;

always @(*) begin
    if(bram_i_sel) begin 
        ibus_rddata = inst_dout;
        ibus_stall = bram_i_stall;
    end else if(ahb_i_sel) begin 
        ibus_rddata = ahb_rddata;
        ibus_stall = arbiter_i_act ? ahb_stall : 1'b1;
    end else begin 
        ibus_rddata = 32'h0;
        ibus_stall = 1'b0;
    end
end

always @(*) begin
    if(bram_d_sel) begin 
        dbus_rddata = data_dout;
        dbus_stall = bram_d_stall;
    end else if(ahb_d_sel) begin 
        dbus_rddata = ahb_rddata;
        dbus_stall = arbiter_d_act ? ahb_stall : 1'b1;
    end else begin 
        dbus_rddata = 32'h0;
        dbus_stall = 1'b0;
    end
end

always @(*) begin
    ahb_dataenable = (arbiter_d_act ? dbus_dataenable : ibus_dataenable);
    ahb_rd = (arbiter_d_act & dbus_rd) | (arbiter_i_act & ibus_rd);
    ahb_wr = (arbiter_d_act & dbus_wr) | (arbiter_i_act & ibus_wr);
    ahb_address = (arbiter_d_act ? dbus_address : ibus_address);
    ahb_wrdata = (arbiter_d_act ? dbus_wrdata : ibus_wrdata);
end

always @(posedge clk) begin
    if(~rst_n) begin
        bram_i_1st_cycle <= 1'b1;
        bram_d_1st_cycle <= 1'b1;
    end else begin
        bram_i_1st_cycle <= ~bram_i_stall;
        bram_d_1st_cycle <= ~bram_d_stall;
    end
end

always @(posedge clk) begin : proc_arbiter
    if(~rst_n) begin
        arbiter_i_act <= 1'b0;
        arbiter_d_act <= 1'b0;
    end 
    else 
    case({arbiter_i_act,arbiter_d_act})
        2'b00: begin 
            if(ahb_d_sel)begin //dbus takes priority 
                arbiter_d_act <= 1'b1;
            end else if(ahb_i_sel)begin 
                arbiter_i_act <= 1'b1;
            end
        end
        2'b10: begin 
            if(~ahb_stall)begin 
                arbiter_i_act <= 1'b0;
            end
        end
        2'b01: begin 
            if(~ahb_stall)begin 
                arbiter_d_act <= 1'b0;
                if(dbus_address == 32'h1fd0f010)
                    $display("********** [1fd0f010]=%x",dbus_wrdata);
            end
        end
    endcase // {arbiter_i_act,arbiter_d_act}
end

endmodule