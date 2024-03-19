//~ `New testbench
`timescale  1ns / 1ps

module cic_dec_tb;
parameter PERIOD = 50;          // 20Mhz

parameter R     = 100;          // Decimation factor,抽取倍率
parameter M     = 2 ;           // Differential delay 1 or 2,差分延迟只能是1或2
parameter N     = 3 ;           // Number of stages,阶数，cic左右两边的阶数是一样的，N指其中一边的阶数
parameter BIN   = 10;           // Input data width,输入数据位宽
parameter COUT  = 16;           // Output dout_cut width,输出数据位宽
parameter BOUT  = (BIN + $clog2((R*M)**N));//注意!! 有些综合器会计算溢出，导致BOUT的值错误，请手动计算 BOUT=(BIN + $clog2((R*M)**N)), $clog2是取log2后向上取整数，**代表^
parameter fs    = 20_000_000;   // Sampling rate


reg  clk = 0;
reg  rst_n = 0;
wire dval;
integer fp;
reg [63:0]cnt0=0,cnt1=0;
reg  signed [BIN-1:0] din;
wire signed [BOUT-1:0]dout;
wire signed [COUT-1:0]dout_cut;
reg [BIN-1:0]sine[0:1999];
initial
begin
    forever #(PERIOD/2)  clk=~clk;
end
initial
begin
    #(PERIOD*2) rst_n  =  1;
end


always@(posedge clk)begin
    //输入仿真数据
    //din<=$random%(2**BIN/3);
    din  <= sine[cnt1];// 采样率20MSPS，频率10KHz正弦波 + 200KHz的高频正弦波
    cnt1 <= (cnt1==1999)?0:cnt1 + 1;

    //接收仿真结果,用于输入到matlab
    if (dval) begin
        $fwrite(fp,"%d\n",dout);
        cnt0 <= cnt0 + 1;
    end
end
cic_dec #(
    .R      (R  ),
    .M      (M  ),
    .N      (N  ),
    .BIN    (BIN),
    .COUT   (COUT),
    .BOUT   (BOUT),
    .CUT_METHOD("ROUND"),
    .fs     (fs )
)u_cic_dec(
    .clk     ( clk ),   // fs
    .rst_n   ( rst_n ),
    .din     ( din ),
    .dout    ( dout ),
    .dout_cut( dout_cut ),
    .dval    ( dval )    //dout valid

);

initial
begin
    $dumpfile("wave.vcd");
    $dumpvars(0,u_cic_dec);
    fp=$fopen("dout.log","w");
    $readmemh("sine.txt",sine);
    wait(cnt0==2000)begin
        $fclose(fp);
        $finish;
        
    end
end

endmodule