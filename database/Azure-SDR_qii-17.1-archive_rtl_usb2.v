/************************************************************************************************
*  Name         :usb2.v cy7c68013a
*  Description  :ifclk==24Mhz shift -210
*  Origin       :
*  Author       :helrori2011@gmail.com
************************************************************************************************/
module   usb2
(
   input             clk_24m		,
   input             clk_24m_180	,
   input			 rst_n			,

   input             clk_wr        ,
	input					dval				,
   input     [31:0]  idata          ,
   input     [31:0]  qdata          ,



   output reg[31:0]	 reg_freq		,
   
   inout     [15:0]  USB_FD		    ,
   output            USB_PKTADR0	,
   output            USB_PKTADR1	,
   output            USB_SLRD		,
   output            USB_SLWR		,
   output            USB_PKTEND	    ,
   output            USB_SLOE		,
   input             USB_FLAGA	    ,
   input             USB_FLAGB	    ,
   output            USB_IFCLK	    ,
   output            USB_SLCS		

);

reg 	up_req=0;
wire 	up_grant;
wire[15:0]up_dat;
wire      up_fin;

wire 	dn_val;
wire[15:0]dn_dat;

fx2 fx2_0
(
   .clk			(clk_24m						),        //from pll,The same clock as the ADC
   .clk_180		(clk_24m_180					),    //from pll,for FX2 slave fifo write clk
   .rst_n		(rst_n							),
   //cyusb outside
   .cy_data		(USB_FD							),
   .cy_addr		({USB_PKTADR1,USB_PKTADR0}	    ),
   .cy_slrd_n	(USB_SLRD						),
   .cy_slwr_n	(USB_SLWR						),
   .cy_pkend_n	(USB_PKTEND						),
   .cy_sloe_n	(USB_SLOE						),
   .cy_flaga	(USB_FLAGA						),
   .cy_flagb	(USB_FLAGB						),
   .cy_ifclk	(USB_IFCLK						),
   .cy_ifclk_ok (USB_SLCS						),
   
   .up_req     ( up_req   						),
   .up_grant   ( up_grant 						),
   .up_dat     ( up_dat 						),    //prefetch
   .up_fin     ( up_fin 						),
   .dn_val     ( dn_val 						),
   .dn_dat     ( dn_dat 						)
   
);
reg [8:0]cnt0=0;
always@(posedge clk_24m or negedge rst_n)begin
    if ( !rst_n ) 
        cnt0<=0;
    else if(dn_val)
        cnt0<=cnt0+1;
    else 
        cnt0<=0;
end
reg [47:0]comb;
reg [15:0]cmd;
localparam  EN_RDFIFO = 0,
            EN_WRFIFO = 1;
always@(posedge clk_24m or negedge rst_n)begin
    if ( !rst_n ) begin
        reg_freq<=0;
        cmd<=0;
        comb<=0;
    end else begin
        if(dn_val && (cnt0<3))begin
            comb<={comb[31:0],{dn_dat[7:0],dn_dat[15:8]}};
        end else if(cnt0==3)begin
            {cmd,reg_freq}<=comb;
        end
    end
end

wire rdempty,wrfull;
wire [9:0]rdusedw;
reg wrreq=0;
fifo fifo_0
(
    .wrclk		( clk_wr  	    ),
    .wrreq		( (~wrfull)&dval 	),
    .data       ( {qdata,idata} ),//64
    .rdclk      ( clk_24m  	),
    .rdreq		( up_grant  ),
    .q			( up_dat    ),//16
    .rdusedw    ( rdusedw   ),//10

    .rdempty	( rdempty 	),
    .wrfull		( wrfull  	)
);
reg [1:0]st=0;
always@(posedge clk_24m or negedge rst_n)begin
    if ( !rst_n ) begin
        up_req<=0;
        st<=0;
    end else begin
        case(st)
            0:begin
               if (cmd[EN_RDFIFO]) begin
                   st<=st+1;
               end 
            end
            1:begin
                if (rdusedw >= 256) begin
                    st<=st+1;
                    up_req<=1;
                end
            end
            2:begin
                if (up_fin) begin
                    up_req<=0;
                    st<=0;
                end
            end
            default:st<=0;
        endcase
    end
end
endmodule
