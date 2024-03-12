`timescale 1ns / 1ps
module crc_gen #(
    parameter    DAT_TYP       = "ETH"            ,            
    parameter    DWID          = 256              ,            
    parameter    BWID          = DWID/8           ,            
    parameter    DWNUM         = DWID/64          ,            
    parameter    MTY_WID       = logb(BWID)     ,            
    parameter    PLEN_WID      = 16               ,            
    parameter    CHN_NUM       = 4                ,            
    parameter    CHN_ID_WID    = logb(CHN_NUM)               
)
(
    input   wire                        clk                         ,   
    input   wire                        rst                         ,   
    input   wire                        vld                         ,   
    input   wire [CHN_ID_WID-1:0]       cid                         ,   
    input   wire                        soc                         ,   
    input   wire                        eoc                         ,   
    input   wire                        sop                         ,   
    input   wire                        eop                         ,   
    input   wire [MTY_WID-1:0]          mty                         ,   
    input   wire [PLEN_WID-1:0]         plen                        ,   
    input   wire [DWID-1:0]             data                        ,   
    output  reg                         crc_out_vld                 ,   
    output  reg  [16-1:0]    		    crc_out                         
);
reg  [DWID-1:0]                         vld_data_tmp1              ;    
reg  [DWID-1:0]                         vld_data_tmp2              ;    
reg                                     vld_d1                     ;    
reg  [CHN_ID_WID-1:0]                   cid_d1                     ;    
reg                                     soc_d1                     ;    
reg                                     eoc_d1                     ;    
reg                                     sop_d1                     ;    
reg                                     eop_d1                     ;    
reg  [MTY_WID-1:0]                      mty_d1                     ;    
reg  [DWID-1:0]                         data_d1                    ;    
reg 								    vld_eop			           ;    
reg                                     eoc_d2                     ;    
reg                                     eoc_d3                     ;    
reg                                     eoc_d4                     ;    
reg                                     eop_d2                     ;    
reg                                     eop_d3                     ;    
reg                                     eop_d4                     ;    
reg  [2*CHN_NUM-1:0]                    eth_pkt_rxcnt              ;
wire [3:0]                              ip_hlen                    ;
wire [15:0]                             ip_total_len               ;
wire [15:0]                             tcp_total_len              ;
wire [7:0]                              ip_pro_id                  ;
wire [47:0]                             sip_diphigh                ;
wire [15:0]                             diplow                     ;
reg  [DWID-1:0]                         eth_crc_data               ;
reg  [CHN_NUM-1:0]             mask_padding              ;
reg  [CHN_NUM-1:0]             mask_padding_d1           ;
reg  [PLEN_WID*CHN_NUM-1:0]             plen_left_reg              ;
reg  [PLEN_WID-1:0]             		    plen_left	           ;
reg  [24*DWNUM-1:0]         		crc_in   	           ;                        
reg  [24*DWNUM-1:0]         		crc_out_tmp	           ;                        
reg  [24*DWNUM*CHN_NUM-1:0]    		crc_reg 	           ; 
reg [32-1:0] crc_step1;   

reg  [24*DWNUM-1:0]         		crc_out_tmp_reg	           ;     

reg [17-1:0] crc_step2;  
reg [16-1:0] crc_step3;

always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        vld_d1 <= 1'b0 ;
        mty_d1 <= 1'b0 ;
        cid_d1 <= 0 ;
        soc_d1 <= 1'b0 ;
        eoc_d1 <= 1'b0 ;
        sop_d1 <= 1'b0 ;
        eop_d1 <= 1'b0 ;
        eoc_d2 <= 1'b0 ;
        eoc_d3 <= 1'b0 ;
        eoc_d4 <= 1'b0 ;
        eop_d2 <= 1'b0 ;
        eop_d3 <= 1'b0 ;
        eop_d4 <= 1'b0 ;
	crc_out_vld <= 1'b0;
    end
    else 
    begin
        vld_d1 <= vld ;
        mty_d1 <= mty ;
        cid_d1 <= cid ;
        soc_d1 <= soc ;
        eoc_d1 <= eoc ;
        sop_d1 <= sop ;
        eop_d1 <= eop ;
        eoc_d2 <= eoc_d1 ;
        eoc_d3 <= eoc_d2 ;
        eoc_d4 <= eoc_d3 ;
        eop_d2 <= eop_d1 ;
        eop_d3 <= eop_d2 ;
        eop_d4 <= eop_d3 ;
	crc_out_vld <= eoc_d4 & eop_d4;
    end
end


always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
		mask_padding <= 0;
    end
    else if ( eop==1'b1 && eoc==1'b1 && vld==1'b1 ) 
    begin
		mask_padding[cid] <= 1'b0;
    end
    else if ( vld_eop==1'b1 ) 
    begin
		mask_padding[cid] <= 1'b1;
    end
end
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
		mask_padding_d1 <= 0;
    end
    else 
    begin
		mask_padding_d1 <= mask_padding[cid];
    end
end


always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
		    plen_left_reg <= 0;
    end
    else if ( vld==1'b1 && sop==1'b1 && soc==1'b1 )
    begin
		    plen_left_reg[PLEN_WID*cid+:PLEN_WID] <= plen - BWID                                    ;
    end
    else if ( vld==1'b1 && vld_eop == 1'b1 )           
    begin
	   	 plen_left_reg[PLEN_WID*cid+:PLEN_WID] <= 0                                              ;
    end
    else if ( vld==1'b1 && mask_padding[cid] == 1'b0 )     
    begin
        plen_left_reg[PLEN_WID*cid+:PLEN_WID] <= plen_left_reg[PLEN_WID*cid +: PLEN_WID] - BWID ;
    end
end
always @ ( * ) begin
	if( vld==1'b1 && sop==1'b1 && soc==1'b1 ) 
	begin
		plen_left = plen;
	end
	else
	begin
		plen_left = plen_left_reg[PLEN_WID*cid +: PLEN_WID];
	end
end
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        eth_pkt_rxcnt  <= {(2*CHN_NUM){1'b0}};
    end
    else if ( eop==1'b1 && eoc==1'b1 && vld==1'b1 )  
    begin
		    eth_pkt_rxcnt[2*cid+:2] <= 2'b00;
    end
    else if ( vld ==1'b1 && eth_pkt_rxcnt[2*cid+:2] != 2'b11 ) 
    begin
		    eth_pkt_rxcnt[2*cid+:2] <= eth_pkt_rxcnt[2*cid+:2] + 2'b01;
    end
end
integer k;
always @( * )
begin
    for( k=0; k<BWID; k=k+1 )
    	begin
		if( k<mty ) begin
    		    	vld_data_tmp1[k*8+:8] = 0 ;
		end
		else begin
    		    	vld_data_tmp1[k*8+:8] = data[k*8+:8] ;
		end
	end
end
assign ip_hlen       = data[DWID-14*8-4-1 :DWID-14*8-8]         ;
assign ip_total_len  = data[DWID-14*8-16-1:DWID-14*8-32]        ;
assign tcp_total_len = ip_total_len - {10'd0, ip_hlen,2'b00}    ;
assign ip_pro_id     = data[DWID-14*8-72-1:DWID-14*8-80]  ;
assign sip_diphigh   = data[0+:48]                        ;
assign diplow        = data[DWID-1:DWID-16]               ;
always @( * )
begin
    if ( eth_pkt_rxcnt[2*cid+:2] == 2'b00 )
    begin
        eth_crc_data = {  {(14*8){1'b0}} , 16'd0 , tcp_total_len , 40'd0 ,ip_pro_id, 16'd0, sip_diphigh } ;
    end
    else if ( eth_pkt_rxcnt[2*cid+:2] == 2'b01 )
    begin
        eth_crc_data = {  diplow , data[239:0] }                                                          ;
    end
    else
    begin
        eth_crc_data =  data                                                                              ;
    end
end
always @( * )
begin
    for( k=0; k<BWID; k=k+1 )
    begin
	      if( plen_left>= BWID ) 
        begin
            vld_data_tmp2[(BWID-k-1)*8+:8] = eth_crc_data[(BWID-k-1)*8+:8] ;
	      end
	      else if( k<plen_left[0+:MTY_WID] )
        begin
          	vld_data_tmp2[(BWID-k-1)*8+:8] = eth_crc_data[(BWID-k-1)*8+:8] ;
	      end   	      
        else 
        begin 
            vld_data_tmp2[(BWID-k-1)*8+:8] = 0 ;
	      end
    end
end
always @( * )
begin
    if( vld==1'b1 && plen_left<=BWID  && mask_padding[cid] == 1'b0 && DAT_TYP=="ETH" ) begin 
		vld_eop = 1'b1;
    end
    else if( vld==1'b1 && eoc==1'b1 && eop==1'b1 && DAT_TYP == "APP" ) begin
		vld_eop = 1'b1;
    end
    else begin
		vld_eop = 1'b0;
    end
end
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        data_d1 <= 256'b0 ;
    end
    else if ( vld_eop==1'b1 && DAT_TYP=="APP")
    begin
        data_d1 <= vld_data_tmp1;
    end
    else if ( DAT_TYP=="ETH" )
    begin
        data_d1 <= vld_data_tmp2;
    end
    else
    begin
        data_d1 <= data ;
    end
end
                    
always @( * )
begin
        crc_in = crc_reg[24*DWNUM*cid_d1 +: 24*DWNUM];
end
always @ ( * ) begin
	for( k=0; k<DWNUM; k=k+1 )begin
		crc_out_tmp[24*k +: 24] = crc_in[24*k +: 24] + data_d1[64*k+00 +: 16] + data_d1[64*k+16 +: 16] + data_d1[64*k+32 +: 16] + data_d1[64*k+48 +: 16] ;
	end
end
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        crc_reg <= 0;
    end
    else if ( vld_d1==1'b1 && eoc_d1==1'b1 && eop_d1==1'b1 )
    begin
        crc_reg[24*DWNUM*cid_d1 +: 24*DWNUM] <= 0;
    end
    else if ( vld_d1==1'b1&&mask_padding_d1==1'b0 )
    begin
        crc_reg[24*DWNUM*cid_d1 +: 24*DWNUM] <= crc_out_tmp;
    end
end
                 
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        crc_out_tmp_reg <= 0;
    end
    else 
    begin
        crc_out_tmp_reg <= crc_out_tmp;
    end
end

always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        crc_step1 <= 0;
    end
    else 
    begin
        crc_step1 <= {8'h0,crc_out_tmp_reg[0*24+:24]} +{8'h0,crc_out_tmp_reg[1*24+:24]} + {8'h0,crc_out_tmp_reg[2*24+:24]} + {8'h0,crc_out_tmp_reg[3*24+:24]};
    end
end

always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        crc_step2 <= 0;
    end
    else 
    begin
        crc_step2 <= crc_step1[15:0] + crc_step1[31:16];
    end
end

always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        crc_step3 <= 0;
    end
    else 
    begin
        crc_step3 <= crc_step2[15:0] + crc_step2[16];
    end
end
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        crc_out <= 0;
    end
    else 
    begin
        crc_out <= crc_step3;
    end
end
function integer logb;
  input integer depth;
  integer depth_reg;
        begin
        depth_reg = depth;
        for (logb=0; depth_reg>0; logb=logb+1)begin
          depth_reg = depth_reg >> 1;
        end
        if( 2**logb >= depth*2 )begin
          logb = logb - 1;
        end
        end 
endfunction
endmodule
