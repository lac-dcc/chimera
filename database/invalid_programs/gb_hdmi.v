module hdmi(
    clock25mhz, resetn,
    x, y,
    r, g, b,
    
	//////////// HDMI-TX //////////
	HDMI_TX_CLK,
	HDMI_TX_D,
	HDMI_TX_DE,
	HDMI_TX_HS,
	HDMI_TX_INT,
	HDMI_TX_VS
);

parameter CYCLE_DELAY = 0;

parameter WIDTH = 160;
parameter HEIGHT = 144;
parameter XDIV = 3;
parameter YDIV = 3;
parameter XSTART = 80;
parameter YSTART = 24;
parameter XEND = XSTART + XDIV*WIDTH;
parameter YEND = YSTART + YDIV*HEIGHT;

parameter HSIZE = 640;
parameter VSIZE = 480;
parameter HTOTAL = 800;
parameter VTOTAL = 525;
parameter HSYNC = 96;
parameter VSYNC = 2;
parameter HSTART = 144;
parameter VSTART = 34;
parameter HEND = HSTART + HSIZE;
parameter VEND = VSTART + VSIZE;


input clock25mhz;
input resetn;
output reg [11:0] x;
output reg [11:0] y;
input [7:0] r;
input [7:0] g;
input [7:0] b;

output HDMI_TX_CLK = ~clock25mhz;
output [23:0] HDMI_TX_D = hdmi_data;
output HDMI_TX_DE = hdmi_de[1];
output HDMI_TX_HS = hdmi_hsync[1];
output HDMI_TX_VS = hdmi_vsync[1];
input HDMI_TX_INT;


reg [23:0] hdmi_data;
reg hdmi_de [2];
reg hdmi_hsync [2];
reg hdmi_vsync [2];

reg [11:0] hdmi_hprecount;
reg [11:0] hdmi_vprecount;
reg [11:0] hdmi_hcount;
reg [11:0] hdmi_vcount;
wire hdmi_hactive = hdmi_hcount >= HSTART && hdmi_hcount < HEND;
wire hdmi_vactive = hdmi_vcount >= VSTART && hdmi_vcount < VEND;
wire hdmi_active = hdmi_hactive && hdmi_vactive;
wire hdmi_hpresync = ~(hdmi_hcount < HSYNC);
wire hdmi_vpresync = ~(hdmi_vcount < VSYNC);

always @(posedge clock25mhz or negedge resetn) begin
    if (!resetn) begin
        hdmi_de[0] <= 0; 
        hdmi_de[1] <= 0;
        hdmi_hsync[0] <= 0;
        hdmi_hsync[1] <= 0;
        hdmi_vsync[0] <= 0;
        hdmi_vsync[1] <= 0;
        hdmi_hcount <= 0;
        hdmi_vcount <= 0;
    end else begin
        hdmi_de[0] <= hdmi_active;
        hdmi_de[1] <= hdmi_de[0];
        hdmi_hsync[0] <= hdmi_hpresync;
        hdmi_hsync[1] <= hdmi_hsync[0];
        hdmi_vsync[0] <= hdmi_vpresync;
        hdmi_vsync[1] <= hdmi_vsync[0];
    
        if (hdmi_hcount + 1'b1 == HTOTAL) begin
            hdmi_hcount <= 0;
            
            if (hdmi_vcount + 1'b1 == VTOTAL) begin
                hdmi_vcount <= 0;
            end else begin
                hdmi_vcount <= hdmi_vcount + 1'b1;
            end
        end else begin
            hdmi_hcount <= hdmi_hcount + 1'b1;
        end
    end
end


wire xactive = hdmi_hcount >= HSTART+XSTART && hdmi_hcount < HSTART+XEND;
wire yactive = hdmi_vcount >= VSTART+YSTART && hdmi_vcount < VSTART+YEND;
wire xsetup = hdmi_hcount >= HSTART+XSTART-CYCLE_DELAY && hdmi_hcount < HSTART+XEND-CYCLE_DELAY;
wire ysetup = hdmi_vcount >= VSTART+YSTART && hdmi_vcount < VSTART+YEND;

reg [$clog2(XDIV)-1:0] xcount;
reg [$clog2(YDIV)-1:0] ycount;

always @(posedge clock25mhz or negedge resetn) begin
    if (!resetn) begin
        hdmi_data <= 0;
        xcount <= 0;
        x <= 0;
        ycount <= 0;
        y <= 0;
    end else begin
        if (xactive && yactive) begin
            hdmi_data <= {r, g, b};
        end else begin
            hdmi_data <= 0;
        end
    
        if (xsetup && ysetup) begin
            if (xcount + 1'b1 == XDIV) begin
                xcount <= 0;
                if (x + 1'b1 == WIDTH) begin
                    x <= 0;
                    if (ycount + 1'b1 == YDIV) begin
                        ycount <= 0;
                        if (y + 1'b1 == HEIGHT) begin
                            y <= 0;
                        end else begin
                            y <= y + 1'b1;
                        end
                    end else begin
                        ycount <= ycount + 1'b1;
                    end
                end else begin
                    x <= x + 1'b1;
                end
            end else begin
                xcount <= xcount + 1'b1;
            end
        end
    end 
end

endmodule

