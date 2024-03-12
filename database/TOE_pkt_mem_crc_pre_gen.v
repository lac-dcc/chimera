`timescale 1ns / 1ps
module crc_pre_gen #(
    parameter    CHN_NUM       = 6               
)
(
    input   wire                        clk                         ,   
    input   wire                        rst                         ,   
    input   wire                        vld                         ,   
    input   wire [2:0]                  cid                         ,   
    input   wire                        soc                         ,   
    input   wire                        eoc                         ,   
    input   wire                        sop                         ,   
    input   wire                        eop                         ,   
    input   wire [4:0]                  mty                         ,   
    input   wire [255:0]                data                        ,   
    output  reg                         crc_out_vld                 ,   
    output  reg  [15:0]                 crc_out                         
);
reg                                     vld_d1                     ;    
reg  [2:0]                              cid_d1                     ;    
reg                                     soc_d1                     ;    
reg                                     eoc_d1                     ;    
reg                                     sop_d1                     ;    
reg                                     eop_d1                     ;    
reg  [4:0]                              mty_d1                     ;    
reg  [255:0]                            data_d1                    ;    
reg                                     vld_d2                     ;    
reg  [2:0]                              cid_d2                     ;    
reg                                     soc_d2                     ;    
reg                                     eoc_d2                     ;    
reg                                     sop_d2                     ;    
reg                                     eop_d2                     ;    
reg  [4:0]                              mty_d2                     ;    
reg  [255:0]                            data_d2                    ;    
reg                                     vld_d3                     ;    
reg  [2:0]                              cid_d3                     ;    
reg                                     soc_d3                     ;    
reg                                     eoc_d3                     ;    
reg                                     sop_d3                     ;    
reg                                     eop_d3                     ;    
reg  [255:0]                            data_d3                    ;    
reg  [15:0]                             ip_len_left[CHN_NUM-1:0]   ;    
reg  [15:0]                             ip_len_left_d1             ;    
reg  [15:0]                             ip_len_left_d2             ;    
wire [63:0]                             data0                      ;    
wire [63:0]                             data1                      ;    
wire [63:0]                             data2                      ;    
wire [63:0]                             data3                      ;    
reg  [18:0]                             crc_in0                    ;    
reg  [18:0]                             crc_in1                    ;    
reg  [18:0]                             crc_in2                    ;    
reg  [18:0]                             crc_in3                    ;    
wire [18:0]                             crc_in_tmp0                ;    
wire [18:0]                             crc_in_tmp1                ;    
wire [18:0]                             crc_in_tmp2                ;    
wire [18:0]                             crc_in_tmp3                ;    
wire [18:0]                             crc_tmp0                   ;    
wire [18:0]                             crc_tmp1                   ;    
wire [18:0]                             crc_tmp2                   ;    
wire [18:0]                             crc_tmp3                   ;    
reg  [18:0]                             crc_tmp_reg0               ;    
reg  [18:0]                             crc_tmp_reg1               ;    
reg  [18:0]                             crc_tmp_reg2               ;    
reg  [18:0]                             crc_tmp_reg3               ;    
reg  [18:0]                             crc_reg_tmp0               ;    
reg  [18:0]                             crc_reg_tmp1               ;    
reg  [18:0]                             crc_reg_tmp2               ;    
reg  [18:0]                             crc_reg_tmp3               ;    
reg  [18:0]                             pkt_crc_tmp0[CHN_NUM-1:0]  ;    
reg  [18:0]                             pkt_crc_tmp1[CHN_NUM-1:0]  ;    
reg  [18:0]                             pkt_crc_tmp2[CHN_NUM-1:0]  ;    
reg  [18:0]                             pkt_crc_tmp3[CHN_NUM-1:0]  ;    
reg  [18:0]                             crc_tmp                    ;    
reg  [16:0]                             crc_out_tmp                ;    
reg                                     crc_out_vld_p3             ;    
reg                                     crc_out_vld_p2             ;    
reg                                     crc_out_vld_p1             ;    
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        vld_d1 <= 1'b0 ;
        vld_d2 <= 1'b0 ;
        vld_d3 <= 1'b0 ;
    end
    else
    begin
        vld_d1 <= vld ;
        vld_d2 <= vld_d1 ;
        vld_d3 <= vld_d2 ;
    end
end
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        mty_d1 <= 5'b0 ;
        mty_d2 <= 5'b0 ;
        cid_d1 <= 3'b0 ;
        cid_d2 <= 3'b0 ;
        cid_d3 <= 3'b0 ;
        soc_d1 <= 1'b0 ;
        eoc_d1 <= 1'b0 ;
        sop_d1 <= 1'b0 ;
        eop_d1 <= 1'b0 ;
        soc_d2 <= 1'b0 ;
        eoc_d2 <= 1'b0 ;
        sop_d2 <= 1'b0 ;
        eop_d2 <= 1'b0 ;
        soc_d3 <= 1'b0 ;
        eoc_d3 <= 1'b0 ;
        sop_d3 <= 1'b0 ;
        eop_d3 <= 1'b0 ;
    end
    else if ( vld == 1'b1 )
    begin
        mty_d1 <= mty    ;
        mty_d2 <= mty_d1 ;
        cid_d1 <= cid ;
        cid_d2 <= cid_d1 ;
        cid_d3 <= cid_d2 ;
        soc_d1 <= soc ;
        eoc_d1 <= eoc ;
        sop_d1 <= sop ;
        eop_d1 <= eop ;
        soc_d2 <= soc_d1 ;
        eoc_d2 <= eoc_d1 ;
        sop_d2 <= sop_d1 ;
        eop_d2 <= eop_d1 ;
        soc_d3 <= soc_d2 ;
        eoc_d3 <= eoc_d2 ;
        sop_d3 <= sop_d2 ;
        eop_d3 <= eop_d2 ;
    end
    else ;
end
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        data_d1 <= 256'b0 ;
    end
    else
    begin
        data_d1 <= data ;
    end
end
genvar i ;
generate
for ( i = 0 ; i < CHN_NUM ; i = i +1 )
begin : ip_len_loop
    always @( posedge clk or posedge rst )
    begin
        if ( rst == 1'b1 )
        begin
            ip_len_left[i] <= 16'b0 ;   
        end
        else if (( vld == 1'b1 ) && ( cid == i ))
        begin
            if (( soc == 1'b1 ) && ( sop == 1'b1 ))
            begin
                ip_len_left[i] <= data[127:112] - 16'h12 ;
            end
            else if ( ip_len_left[i] <= 16'h20 )
            begin
                ip_len_left[i] <= 16'b0 ;
            end
            else
            begin
                ip_len_left[i] <= ip_len_left[i] - 16'h20 ;
            end
        end
        else ;
    end
end
endgenerate
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        ip_len_left_d1 <= 16'b0 ;
    end
    else if ( vld_d1 == 1'b1 )
    begin
        ip_len_left_d1 <= ip_len_left[cid_d1] ;
    end
    else ;
end
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        ip_len_left_d2 <= 16'b0 ;
    end
    else
    begin
        ip_len_left_d2 <= ip_len_left_d1 ;
    end
end
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        data_d2 <= 256'b0 ;
    end
    else if (( soc_d2 == 1'b1 ) && ( sop_d2 == 1'b1 ))
    begin
        data_d2 <= {16'b0, data_d1[239:0]} ;
    end
    else
    begin
        data_d2 <= data_d1 ;
    end
end
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        data_d3 <= 256'b0 ;
    end
    else if ( eoc_d2==1'b1 && eop_d2==1'b1 )
    begin
        case ( mty_d2[4:0] )
            5'b0_0000 : data_d3 <= 256'b0 ;
            5'b0_0001 : data_d3 <= {data_d2[255:248],248'b0} ;
            5'b0_0010 : data_d3 <= {data_d2[255:240],240'b0} ;
            5'b0_0011 : data_d3 <= {data_d2[255:232],232'b0} ;
            5'b0_0100 : data_d3 <= {data_d2[255:224],224'b0} ;
            5'b0_0101 : data_d3 <= {data_d2[255:216],216'b0} ;
            5'b0_0110 : data_d3 <= {data_d2[255:208],208'b0} ;
            5'b0_0111 : data_d3 <= {data_d2[255:200],200'b0} ;
            5'b0_1000 : data_d3 <= {data_d2[255:192],192'b0} ;
            5'b0_1001 : data_d3 <= {data_d2[255:184],184'b0} ;
            5'b0_1010 : data_d3 <= {data_d2[255:176],176'b0} ;
            5'b0_1011 : data_d3 <= {data_d2[255:168],168'b0} ;
            5'b0_1100 : data_d3 <= {data_d2[255:160],160'b0} ;
            5'b0_1101 : data_d3 <= {data_d2[255:152],152'b0} ;
            5'b0_1110 : data_d3 <= {data_d2[255:144],144'b0} ;
            5'b0_1111 : data_d3 <= {data_d2[255:136],136'b0} ;
            5'b1_0000 : data_d3 <= {data_d2[255:128],128'b0} ;
            5'b1_0001 : data_d3 <= {data_d2[255:120],120'b0} ;
            5'b1_0010 : data_d3 <= {data_d2[255:112],112'b0} ;
            5'b1_0011 : data_d3 <= {data_d2[255:104],104'b0} ;
            5'b1_0100 : data_d3 <= {data_d2[255:96],96'b0} ;
            5'b1_0101 : data_d3 <= {data_d2[255:88],88'b0} ;
            5'b1_0110 : data_d3 <= {data_d2[255:80],80'b0} ;
            5'b1_0111 : data_d3 <= {data_d2[255:72],72'b0} ;
            5'b1_1000 : data_d3 <= {data_d2[255:64],64'b0} ;
            5'b1_1001 : data_d3 <= {data_d2[255:56],56'b0} ;
            5'b1_1010 : data_d3 <= {data_d2[255:48],48'b0} ;
            5'b1_1011 : data_d3 <= {data_d2[255:40],40'b0} ;
            5'b1_1100 : data_d3 <= {data_d2[255:32],32'b0} ;
            5'b1_1101 : data_d3 <= {data_d2[255:24],24'b0} ;
            5'b1_1110 : data_d3 <= {data_d2[255:16],16'b0} ;
            5'b1_1111 : data_d3 <= {data_d2[255:8],8'b0} ;
        endcase
    end
    else if ( ip_len_left_d2 < 16'h20 )
    begin
        case ( ip_len_left_d2[4:0] )
            5'b0_0000 : data_d3 <= 256'b0 ;
            5'b0_0001 : data_d3 <= {data_d2[255:248],248'b0} ;
            5'b0_0010 : data_d3 <= {data_d2[255:240],240'b0} ;
            5'b0_0011 : data_d3 <= {data_d2[255:232],232'b0} ;
            5'b0_0100 : data_d3 <= {data_d2[255:224],224'b0} ;
            5'b0_0101 : data_d3 <= {data_d2[255:216],216'b0} ;
            5'b0_0110 : data_d3 <= {data_d2[255:208],208'b0} ;
            5'b0_0111 : data_d3 <= {data_d2[255:200],200'b0} ;
            5'b0_1000 : data_d3 <= {data_d2[255:192],192'b0} ;
            5'b0_1001 : data_d3 <= {data_d2[255:184],184'b0} ;
            5'b0_1010 : data_d3 <= {data_d2[255:176],176'b0} ;
            5'b0_1011 : data_d3 <= {data_d2[255:168],168'b0} ;
            5'b0_1100 : data_d3 <= {data_d2[255:160],160'b0} ;
            5'b0_1101 : data_d3 <= {data_d2[255:152],152'b0} ;
            5'b0_1110 : data_d3 <= {data_d2[255:144],144'b0} ;
            5'b0_1111 : data_d3 <= {data_d2[255:136],136'b0} ;
            5'b1_0000 : data_d3 <= {data_d2[255:128],128'b0} ;
            5'b1_0001 : data_d3 <= {data_d2[255:120],120'b0} ;
            5'b1_0010 : data_d3 <= {data_d2[255:112],112'b0} ;
            5'b1_0011 : data_d3 <= {data_d2[255:104],104'b0} ;
            5'b1_0100 : data_d3 <= {data_d2[255:96],96'b0} ;
            5'b1_0101 : data_d3 <= {data_d2[255:88],88'b0} ;
            5'b1_0110 : data_d3 <= {data_d2[255:80],80'b0} ;
            5'b1_0111 : data_d3 <= {data_d2[255:72],72'b0} ;
            5'b1_1000 : data_d3 <= {data_d2[255:64],64'b0} ;
            5'b1_1001 : data_d3 <= {data_d2[255:56],56'b0} ;
            5'b1_1010 : data_d3 <= {data_d2[255:48],48'b0} ;
            5'b1_1011 : data_d3 <= {data_d2[255:40],40'b0} ;
            5'b1_1100 : data_d3 <= {data_d2[255:32],32'b0} ;
            5'b1_1101 : data_d3 <= {data_d2[255:24],24'b0} ;
            5'b1_1110 : data_d3 <= {data_d2[255:16],16'b0} ;
            5'b1_1111 : data_d3 <= {data_d2[255:8],8'b0} ;
        endcase
    end
    else
    begin
        data_d3 <= data_d2 ;
    end
end
assign {data0, data1, data2, data3} = data_d3 ;
assign crc_in_tmp0 = ( soc_d3 == 1'b1 ) ?  crc_in0 : crc_tmp_reg0 ;
assign crc_in_tmp1 = ( soc_d3 == 1'b1 ) ?  crc_in1 : crc_tmp_reg1 ;
assign crc_in_tmp2 = ( soc_d3 == 1'b1 ) ?  crc_in2 : crc_tmp_reg2 ;
assign crc_in_tmp3 = ( soc_d3 == 1'b1 ) ?  crc_in3 : crc_tmp_reg3 ;
assign crc_tmp0 = crc_in_tmp0[15:0] + {13'b0,crc_in_tmp0[18:16]} + data0[15:0] + data0[31:16] + data0[47:32] + data0[63:48] ;
assign crc_tmp1 = crc_in_tmp1[15:0] + {13'b0,crc_in_tmp1[18:16]} + data1[15:0] + data1[31:16] + data1[47:32] + data1[63:48] ;
assign crc_tmp2 = crc_in_tmp2[15:0] + {13'b0,crc_in_tmp2[18:16]} + data2[15:0] + data2[31:16] + data2[47:32] + data2[63:48] ;
assign crc_tmp3 = crc_in_tmp3[15:0] + {13'b0,crc_in_tmp3[18:16]} + data3[15:0] + data3[31:16] + data3[47:32] + data3[63:48] ;
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        crc_tmp_reg0 <= 19'b0 ;
        crc_tmp_reg1 <= 19'b0 ;
        crc_tmp_reg2 <= 19'b0 ;
        crc_tmp_reg3 <= 19'b0 ;
    end
    else if ( vld_d3 == 1'b1 )
    begin
        crc_tmp_reg0 <= crc_tmp0 ;
        crc_tmp_reg1 <= crc_tmp1 ;
        crc_tmp_reg2 <= crc_tmp2 ;
        crc_tmp_reg3 <= crc_tmp3 ;
    end
    else ;
end
genvar j ;
generate
for ( j = 0 ; j < CHN_NUM ; j = j +1 )
begin : pcrc_loop
    always @( posedge clk or posedge rst )
    begin
        if ( rst == 1'b1 )
        begin
            pkt_crc_tmp0[j] <= 19'b0 ;
            pkt_crc_tmp1[j] <= 19'b0 ;
            pkt_crc_tmp2[j] <= 19'b0 ;
            pkt_crc_tmp3[j] <= 19'b0 ;
        end
        else if (( vld_d3 == 1'b1 ) && ( eoc_d3 == 1'b1 ) && ( cid_d3 == j ))
        begin
            pkt_crc_tmp0[j] <= crc_tmp0 ;
            pkt_crc_tmp1[j] <= crc_tmp1 ;
            pkt_crc_tmp2[j] <= crc_tmp2 ;
            pkt_crc_tmp3[j] <= crc_tmp3 ;
        end
        else ;
    end
end
endgenerate
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        crc_in0 <= 19'b0 ;
        crc_in1 <= 19'b0 ;
        crc_in2 <= 19'b0 ;
        crc_in3 <= 19'b0 ;
    end
    else if ( sop_d2 == 1'b1 )
    begin
        crc_in0 <= 19'b0 ;
        crc_in1 <= 19'b0 ;
        crc_in2 <= 19'b0 ;
        crc_in3 <= 19'b0 ;
    end
    else
    begin
        crc_in0 <= pkt_crc_tmp0[cid_d2] ;
        crc_in1 <= pkt_crc_tmp1[cid_d2] ;
        crc_in2 <= pkt_crc_tmp2[cid_d2] ;
        crc_in3 <= pkt_crc_tmp3[cid_d2] ;
    end
end
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        crc_tmp <= 19'b0 ;
    end
    else
    begin
        crc_tmp <= {2'b0,crc_tmp_reg0} + {2'b0,crc_tmp_reg1} + {2'b0,crc_tmp_reg2} + {2'b0,crc_tmp_reg3} ;
    end
end
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        crc_out_tmp <= 19'b0 ;
    end
    else
    begin
        crc_out_tmp <= {1'b0,crc_tmp[15:0]} + {15'b0,crc_tmp[17:16]} ;
    end
end
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        crc_out <= 16'b0 ;
    end
    else
    begin
        crc_out <= crc_out_tmp[15:0] + {15'b0,crc_out_tmp[16]} ;
    end
end
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        crc_out_vld_p3 <= 1'b0 ;
    end
    else if (( vld_d3 == 1'b1 ) && ( eoc_d3 == 1'b1 ) && ( eop_d3 == 1'b1 ))
    begin
        crc_out_vld_p3 <= 1'b1 ;
    end
    else
    begin
        crc_out_vld_p3 <= 1'b0 ;
    end
end
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        crc_out_vld_p2 <= 1'b0 ;
        crc_out_vld_p1 <= 1'b0 ;
        crc_out_vld    <= 1'b0 ;
    end
    else
    begin
        crc_out_vld_p2 <= crc_out_vld_p3 ;
        crc_out_vld_p1 <= crc_out_vld_p2 ;
        crc_out_vld    <= crc_out_vld_p1 ;
    end
end
endmodule
