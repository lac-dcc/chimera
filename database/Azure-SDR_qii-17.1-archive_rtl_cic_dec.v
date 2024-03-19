/*****************************************************************************
*   Name        :cic_dec
*   Description :cic decimator,必须使用有符号整数。在该模块中，截掉低位的做法没有发现问题
*					  如果发现dout_cut的数据很小，请抓取dout的实际数据，看看dout的变化范围，
*					  再选择截掉高位还是低位。
*   Origin      :200317
*                200322
*   Author      :helrori
******************************************************************************/
module cic_dec
#(
    parameter R     = 32,           // Decimation factor
    parameter M     = 1 ,           // Differential delay 1 or 2
    parameter N     = 3 ,           // Number of stages
    parameter BIN   = 10,           // Input data width
    parameter COUT  = 16,           // Output dout_cut width
    parameter CUT_METHOD = "ROUND", // 
    parameter fs    = 20_000_000,   // Sampling rate
    parameter BOUT  = 32            // 请在外部计算 BOUT=(BIN + $clog2((R*M)**N)), 
)
(
    input   wire            clk     ,   // fs
    input   wire            rst_n   ,
    input   wire [BIN-1 :0] din     ,
    output  wire [BOUT-1:0] dout    ,   //origin data
    output  wire [COUT-1:0] dout_cut,   //data cut 
    output  wire            dval        //dout valid
);
localparam fInput_nyquist  = fs/2;
localparam fOutput_nyquist = fInput_nyquist/R;
initial begin
    $display("\n------------CIC_DEC------------\nR   : %0d", R);
    $display("M   : %0d", M);
    $display("N   : %0d", N);
    $display("BIN : %0d bits", BIN);
    $display("BOUT: %0d bits", BOUT);
    $display("COUT: %0d bits", COUT);
    $display("cut method         : %s", CUT_METHOD);
    $display("input nyquist freq : %0d Hz", fInput_nyquist);
    $display("output nyquist freq: %0d Hz", fOutput_nyquist);
    $display("cnt0 width         : %0d bits\n", $clog2(R));
end
generate
	 // Caution:
	 // 无论是 ROUND 还是 CUT 都是截掉低位,ROUND 多了个四舍五入。如果数据太小则不能截掉低位（否则截掉就变0了），而是看数据实际变化范围截掉高位，推荐抓取数据看看实际变化范围选择截高位还是低位
    if(CUT_METHOD=="ROUND")begin
        wire    carry_bit   =  dout[BOUT-1] ? ( dout[BOUT-(COUT-1)-1-1] & ( |dout[BOUT-(COUT-1)-1-1-1:0] ) ) : dout[BOUT-(COUT-1)-1-1] ;
        assign  dout_cut    = {dout[BOUT-1], dout[BOUT-1:BOUT-(COUT-1)-1]} + carry_bit ;
    end else if(CUT_METHOD=="CUT")begin
        assign  dout_cut    = (dout>>(BOUT-COUT));
    end
endgenerate
/*
*   Integrator
*/
generate
genvar i;
for ( i=0 ; i<N ; i=i+1 ) begin :LOOP
    reg  [BOUT-1:0]inte;
    wire [BOUT-1:0]sum;
    if ( i == 0 ) begin
        assign sum = inte + {{(BOUT-BIN){din[BIN-1]}},din};
    end else begin
        assign sum = inte + ( LOOP[i-1].sum );
    end
    always@(posedge clk or negedge rst_n)begin
        if ( !rst_n )
            inte <= {(BOUT){1'd0}};
        else
            inte <= sum;
    end    
end
endgenerate
wire [BOUT-1:0]inte_out;
assign inte_out=LOOP[N-1].sum;
/*
*   Decimation
*/
reg [$clog2(R)-1:0]cnt0;
reg [BOUT-1:0]dec_out;
assign dval = (cnt0==(R-1));
always@(posedge clk or negedge rst_n)begin
    if ( !rst_n ) begin
        cnt0    <=  'd0;
        dec_out <=  'd0;
    end else begin
        cnt0    <=  dval?'d0        :cnt0 + 1'd1;
        dec_out <=  dval?inte_out   :dec_out;
    end
end

/*
*   Comb
*   全流水线结构，资源消耗大。由于速率降低了R倍，可以使用复用结构，留有时间再改
*/
generate
genvar j;
for ( j=0 ; j<N ; j=j+1 ) begin :LOOP2
    reg  [BOUT-1:0]comb;
    wire [BOUT-1:0]sub;

    if ( j == 0 ) begin
        if(M==1)begin
            assign sub = dec_out - comb;
            always@(posedge clk or negedge rst_n)begin
                if ( !rst_n )
                    comb <= {(BOUT){1'd0}};
                else 
                    comb <= (dval) ? dec_out : comb;
            end  
        end else begin
            reg  [BOUT-1:0]comb1;
            assign sub = dec_out - comb1;
            always@(posedge clk or negedge rst_n)begin
                if ( !rst_n )begin
                    comb <= {(BOUT){1'd0}};
                    comb1<= {(BOUT){1'd0}};
                end else if(dval)begin
                    comb <= dec_out ;
                    comb1<= comb    ;
                end
            end  
        end


    end else begin
        if(M==1)begin
            assign sub = LOOP2[j-1].sub - comb;
            always@(posedge clk or negedge rst_n)begin
                if ( !rst_n )
                    comb <= {(BOUT){1'd0}};
                else
                    comb <= (dval) ? LOOP2[j-1].sub : comb;
            end  
        end else begin
            reg  [BOUT-1:0]comb1;
            assign sub = LOOP2[j-1].sub - comb1;
            always@(posedge clk or negedge rst_n)begin
                if ( !rst_n )begin
                    comb <= {(BOUT){1'd0}};
                    comb1<= {(BOUT){1'd0}};
                end else if(dval)begin
                    comb <=  LOOP2[j-1].sub;
                    comb1<=  comb;
                end
            end  

        end
    end
end
endgenerate
assign dout = LOOP2[N-1].sub;

endmodule
