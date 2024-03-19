/************************************************************************************************
*  Name         :fir_dec.v
*  Description  :复用FIR。约33个时钟计算完一个数据，参数必须满足： CLOCK_PER_SAMPLE * R > 33
*						在该模块中截掉低位的做法没有发现 精度损失太大的情况。如果发现dout的数据很小，
*						请抓取sum的全精度数据，看看 sum 的变化范围，再选择截掉高位还是低位。
*  Origin       :200328
*  Author       :helrori2011@gmail.com
************************************************************************************************/
module fir_dec
#(
        parameter R                   = 2,           // Decimation factor
        parameter COE_FILE            = "1.txt",     // 滤波器系数，16进制16bit有符号数，总共32个参数，最后一个填0，因为实际只用了31个系数
        parameter CLOCK_PER_SAMPLE    = 20           // 多少个时钟，din来一次数据
)
(   //端口位宽不可配置请勿更改
	input   wire            clk     ,
	input   wire            rst_n   ,

	input   wire    [15:0]  din     ,
	input   wire            din_val ,

	output  reg     [31:0]  dout    ,
	output  reg             dout_val
);
//-----------------------------------------------------------------------------------------------

localparam W_DIN = 16;
localparam W_DOUT= 32;
localparam W_COE = 16;
localparam N_COE = 31;
localparam WOUT  = W_DIN + (W_COE+$clog2(N_COE));//全精度
reg  [1 :0]  dec_cnt;
reg  [4 :0]  wraddress,rdaddress,addr_a;
wire [15:0]  q,q_a;
wire         fir_start = ((dec_cnt==R-1) && din_val);
reg  [2 :0]  st;
reg  signed  [15:0] multa;
reg  signed  [15:0] multb;
wire signed  [31:0] result;
reg  signed  [WOUT-1:0]result_b;
wire signed  [WOUT-1:0]sum;
assign result   = multa    * multb ;
assign sum      = result_b + result;
wire dout_val_      = (st==3);


localparam BOUT = WOUT;
localparam COUT = W_DOUT;
// Caution:
// 截掉低位,四舍五入。如果数据太小不能截掉低位，而是看数据实际变化范围截掉高位（否则截掉就变0了），推荐抓取数据看看实际变化范围选择截高位还是低位
wire    carry_bit   =  sum[BOUT-1] ? ( sum[BOUT-(COUT-1)-1-1] & ( |sum[BOUT-(COUT-1)-1-1-1:0] ) ) : sum[BOUT-(COUT-1)-1-1] ;
wire[W_DOUT:0]dout_     = {sum[BOUT-1], sum[BOUT-1:BOUT-(COUT-1)-1]} + carry_bit ;
// 直接截掉
//wire [31:0]dout_    = (sum>>(WOUT-32));
//-----------------------------------------------------------------------------------------------
initial begin
    $display("\n----------fir_dec----------\n");
    $display("W_DIN : %d bit",W_DIN);
    $display("W_DOUT: %d bit",W_DOUT);
    $display("W_COE : %d bit",W_COE);
    $display("N_COE : %d bit",N_COE);
    $display("WOUT  : %d bit\n",WOUT );
end
always@(posedge clk or negedge rst_n)begin
    if ( !rst_n ) begin
        wraddress <= 'd0;
        dec_cnt   <= 'd0;
    end else begin
        wraddress <= ( din_val      )?wraddress+1'd1 :wraddress;
        dec_cnt   <= (!din_val      )?dec_cnt        :
                     ( dec_cnt==R-1 )?'d0            :dec_cnt+1'd1;
    end
end
always@(posedge clk or negedge rst_n)begin
    if ( !rst_n ) begin
        dout_val    <= 'd0;
        dout        <= 'd0;
    end else begin
        dout_val    <= dout_val_;
        dout        <= (dout_val_)?dout_:dout;
    end
end
always@(posedge clk or negedge rst_n)begin
    if ( !rst_n ) begin
        st          <='d0;
        multa       <='d0;
        multb       <='d0;
        result_b    <='d0;
        rdaddress   <='d0;
        addr_a      <='d0;
    end else begin
        case(st)
            0:begin
                if (fir_start) begin
                    multa       <=  din;
                    multb       <=  q_a;
                    result_b    <=  'd0;
                    rdaddress   <=  wraddress - 1'd1;
                    addr_a      <=  addr_a    + 1'd1;
                    st          <=  st        + 1'd1;
                end
            end
            1:begin
                st          <=  st  + 1'd1;
                rdaddress   <=  rdaddress - 1'd1;
                addr_a      <=  addr_a    + 1'd1;
            end
            2:begin
                multa       <=  q;
                multb       <=  q_a;
                result_b    <=  sum;//result_b + multa*multb
                rdaddress   <=  rdaddress - 1'd1;
                if ( addr_a == N_COE ) begin
                    addr_a  <=  'd0;
                    st      <=  st        + 1'd1;
                end else begin
                    addr_a  <=  addr_a    + 1'd1;
                end
            end
            3:begin
                st <= 'd0;
            end
            default:st <= 'd0;
        endcase
    end
end
simple_ram #(
    .widthad    (5 ),//deep 32; 32>N_COE
    .width      (16)
)simple_ram_0(
    .clk        ( clk       ),
    .wraddress  ( wraddress ),
    .wren       ( din_val   ),
    .data       ( din       ),
    .rdaddress  ( rdaddress ),
    .q          ( q         )
);
simple_rom #(
    .widthad    (5 ),//deep 32
    .width      (16),
    .datafile   (COE_FILE)//31 coe
)simple_rom_0(
    .clk        ( clk       ),
    .addr_a     ( addr_a    ),
    .q_a        ( q_a       ),
    .addr_b     (           ),
    .q_b        (           )
);
endmodule
