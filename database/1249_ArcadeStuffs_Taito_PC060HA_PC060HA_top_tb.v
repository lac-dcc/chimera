// This program was cloned from: https://github.com/ika-musume/ArcadeStuffs
// License: GNU General Public License v2.0

`timescale 10ns/10ns
module PC060HA_top_tb;

//resets
reg             nIC = 1'b0;
wire            nROUT;

//clock
reg             CLK = 1'b1;

//slave side
reg             nSCS = 1'b1;
reg             nSRD = 1'b1;
reg             nSWR = 1'b1;
reg             SA0 = 1'b1;
wire    [3:0]   SD;
reg     [3:0]   slaveDataReg = 4'b0000;

//slave side
reg             nMCS = 1'b1;
reg             nMRD = 1'b1;
reg             nMWR = 1'b1;
reg             MA0 = 1'b1;
wire    [3:0]   MD;
reg     [3:0]   masterDataReg = 4'b0000;

//GPIO
reg             IN0 = 1'b1;
reg             IN1 = 1'b0;
wire            nNMI;
wire            AMP;



PC060HA_top PC060HA_top
(
	.nIC (nIC),
    .nROUT (nROUT),

    .SCLK (CLK),
    .MCLK (CLK),

    .nSCS (nSCS),
    .nSRD (nSRD),
    .nSWR (nSWR),
    .SA0 (SA0),
    .SD (SD),

    .nMCS (nMCS),
    .nMRD (nMRD),
    .nMWR (nMWR),
    .MA0 (MA0),
    .MD (MD),

    .IN0 (IN0),
    .IN1 (IN1),
    .nNMI (nNMI),
    .AMP (AMP)
);

//inout port switcher
reg            slave_data_reg_write = 1'b1;   //active low
reg            master_data_reg_write = 1'b1;  //active low
assign          SD = ((slave_data_reg_write) == 1'b1) ? 4'bZZZZ : slaveDataReg;
assign          MD = ((master_data_reg_write) == 1'b1) ? 4'bZZZZ : masterDataReg;

always #1 CLK = ~CLK;

initial
begin
    #7 nIC = 1'b1;
    #1 nIC = 1'b0; //glitch
    #1 nIC = 1'b1; 
end

initial
begin
    #10;

    //cycle 0 = 100ns: 이상한데 읽기
    #0 MA0 = 1'b0;
    #0 nMCS = 1'b1;
    #1 nMRD = 1'b0;
    #4 nMRD = 1'b1;
    #1 nMCS = 1'b1;

    //cycle 1 = 160ns: 이상한데 쓰기
    #0 MA0 = 1'b1;
    #0 nMCS = 1'b1;
    #3 nMWR = 1'b0;
    #2 nMWR = 1'b1;
    #1 nMCS = 1'b1;

    //cycle 2 = 220ns: 마스터 레지스터 읽기 0번
    #0 MA0 = 1'b1;
    #0 nMCS = 1'b0;
    #1 nMRD = 1'b0;
    #4 nMRD = 1'b1;
    #1 nMCS = 1'b0;

    //cycle 3 = 280ns: 마스터 레지스터 읽기 1번
    #0 MA0 = 1'b1;
    #0 nMCS = 1'b0;
    #1 nMRD = 1'b0;
    #4 nMRD = 1'b1;
    #1 nMCS = 1'b0;

    //cycle 4 = 340ns: 마스터 레지스터 읽기 2번
    #0 MA0 = 1'b1;
    #0 nMCS = 1'b0;
    #1 nMRD = 1'b0;
    #4 nMRD = 1'b1;
    #1 nMCS = 1'b0;

    //cycle 5 = 400ns: 마스터 페이지 레지스터 쓰기 (1번)
    #0 MA0 = 1'b0;
    #0 nMCS = 1'b0;
    #0 masterDataReg = 4'b0001;
    #1 master_data_reg_write = 1'b0;
    #2 nMWR = 1'b0;
    #2 nMWR = 1'b1;
    #1 nMCS = 1'b0;
    #0 master_data_reg_write = 1'b1;

    //cycle 6 = 460ns: 마스터 레지스터 쓰기 1번
    #0 MA0 = 1'b1;
    #0 nMCS = 1'b0;
    #0 masterDataReg = 4'b0001;
    #1 master_data_reg_write = 1'b0;
    #2 nMWR = 1'b0;
    #2 nMWR = 1'b1;
    #1 nMCS = 1'b0;
    #0 master_data_reg_write = 1'b1;

    //cycle 7 = 520ns: 마스터 페이지 레지스터 쓰기 (3으로 돌림)
    #0 MA0 = 1'b0;
    #0 nMCS = 1'b0;
    #0 masterDataReg = 4'b0011;
    #1 master_data_reg_write = 1'b0;
    #2 nMWR = 1'b0;
    #2 nMWR = 1'b1;
    #1 nMCS = 1'b0;
    #0 master_data_reg_write = 1'b1;

    //cycle 8 = 580ns: 마스터 레지스터 쓰기 3번
    #0 MA0 = 1'b1;
    #0 nMCS = 1'b0;
    #0 masterDataReg = 4'b0111;
    #1 master_data_reg_write = 1'b0;
    #2 nMWR = 1'b0;
    #2 nMWR = 1'b1;
    #1 nMCS = 1'b0;
    #0 master_data_reg_write = 1'b1;

    //cycle 9 = 640ns: 슬레이브 레지스터 읽기 0번
    #0 SA0 = 1'b1;
    #0 nSCS = 1'b0;
    #1 nSRD = 1'b0;
    #4 nSRD = 1'b1;
    #1 nSCS = 1'b0;

    //cycle 10 = 700ns: 슬레이브 레지스터 읽기 1번
    #0 SA0 = 1'b1;
    #0 nSCS = 1'b0;
    #1 nSRD = 1'b0;
    #4 nSRD = 1'b1;
    #1 nSCS = 1'b0;

    //cycle 11 = 760ns: 슬레이브 페이지 레지스터 쓰기 6번
    #0 SA0 = 1'b0;
    #0 nSCS = 1'b0;
    #0 slaveDataReg = 4'b0110;
    #1 slave_data_reg_write = 1'b0;
    #2 nSWR = 1'b0;
    #2 nSWR = 1'b1;
    #1 nSCS = 1'b0;
    #0 slave_data_reg_write = 1'b1;

    //cycle 12 = 820ns: 슬레이브 레지스터 쓰기 6번(NMI 활성화)
    #0 SA0 = 1'b1;
    #0 nSCS = 1'b0;
    #0 slaveDataReg = 4'b0001;
    #1 slave_data_reg_write = 1'b0;
    #2 nSWR = 1'b0;
    #2 nSWR = 1'b1;
    #1 nSCS = 1'b0;
    #0 slave_data_reg_write = 1'b1;

    //cycle 13 = 880ns: 슬레이브 페이지 레지스터 쓰기 2번
    #0 SA0 = 1'b0;
    #0 nSCS = 1'b0;
    #0 slaveDataReg = 4'b0010;
    #1 slave_data_reg_write = 1'b0;
    #2 nSWR = 1'b0;
    #2 nSWR = 1'b1;
    #1 nSCS = 1'b0;
    #0 slave_data_reg_write = 1'b1;

    //cycle 14 = 940ns: 슬레이브 레지스터 읽기 2번
    #0 SA0 = 1'b1;
    #0 nSCS = 1'b0;
    #1 nSRD = 1'b0;
    #4 nSRD = 1'b1;
    #1 nSCS = 1'b0;

    //cycle 15 = 1000ns: 슬레이브 페이지 레지스터 쓰기 4번
    #0 SA0 = 1'b0;
    #0 nSCS = 1'b0;
    #0 slaveDataReg = 4'b0100;
    #1 slave_data_reg_write = 1'b0;
    #2 nSWR = 1'b0;
    #2 nSWR = 1'b1;
    #1 nSCS = 1'b0;
    #0 slave_data_reg_write = 1'b1;

    //cycle 16 = 1060ns: 슬레이브 레지스터 쓰기 4번
    #0 SA0 = 1'b1;
    #0 nSCS = 1'b0;
    #0 slaveDataReg = 4'b0001;
    #1 slave_data_reg_write = 1'b0;
    #2 nSWR = 1'b0;
    #2 nSWR = 1'b1;
    #1 nSCS = 1'b0;
    #0 slave_data_reg_write = 1'b1;

    //cycle 17 = 1120ns: 슬레이브 페이지 레지스터 쓰기 4번
    #0 SA0 = 1'b0;
    #0 nSCS = 1'b0;
    #0 slaveDataReg = 4'b0100;
    #1 slave_data_reg_write = 1'b0;
    #2 nSWR = 1'b0;
    #2 nSWR = 1'b1;
    #1 nSCS = 1'b0;
    #0 slave_data_reg_write = 1'b1;

    //cycle 18 = 1180ns: 슬레이브 레지스터 읽기 4번
    #0 SA0 = 1'b1;
    #0 nSCS = 1'b0;
    #1 nSRD = 1'b0;
    #4 nSRD = 1'b1;
    #1 nSCS = 1'b0;

    //cycle 19 = 1240ns: 슬레이브 페이지 레지스터 쓰기 3번
    #0 SA0 = 1'b0;
    #0 nSCS = 1'b0;
    #0 slaveDataReg = 4'b0011;
    #1 slave_data_reg_write = 1'b0;
    #2 nSWR = 1'b0;
    #2 nSWR = 1'b1;
    #1 nSCS = 1'b0;
    #0 slave_data_reg_write = 1'b1;

    //cycle 20 = 1300ns: 슬레이브 레지스터 읽기 3번
    #0 SA0 = 1'b1;
    #0 nSCS = 1'b0;
    #1 nSRD = 1'b0;
    #4 nSRD = 1'b1;
    #1 nSCS = 1'b0;
    
    //cycle 21 = 1360ns: 슬레이브 레지스터 읽기 4번
    #0 SA0 = 1'b1;
    #0 nSCS = 1'b0;
    #1 nSRD = 1'b0;
    #4 nSRD = 1'b1;
    #1 nSCS = 1'b0;

    //cycle 22 = 1420ns: 슬레이브 페이지 레지스터 쓰기 0번
    #0 SA0 = 1'b0;
    #0 nSCS = 1'b0;
    #0 slaveDataReg = 4'b0000;
    #1 slave_data_reg_write = 1'b0;
    #2 nSWR = 1'b0;
    #2 nSWR = 1'b1;
    #1 nSCS = 1'b0;
    #0 slave_data_reg_write = 1'b1;

    //cycle 23 = 1480ns: 슬레이브 레지스터 쓰기 0번
    #0 SA0 = 1'b1;
    #0 nSCS = 1'b0;
    #0 slaveDataReg = 4'b1000;
    #1 slave_data_reg_write = 1'b0;
    #2 nSWR = 1'b0;
    #2 nSWR = 1'b1;
    #1 nSCS = 1'b0;
    #0 slave_data_reg_write = 1'b1;

    //cycle 24 = 1540ns: 슬레이브 레지스터 쓰기 1번
    #0 SA0 = 1'b1;
    #0 nSCS = 1'b0;
    #0 slaveDataReg = 4'b1001;
    #1 slave_data_reg_write = 1'b0;
    #2 nSWR = 1'b0;
    #2 nSWR = 1'b1;
    #1 nSCS = 1'b0;
    #0 slave_data_reg_write = 1'b1;

    //cycle 25 = 1600ns: 슬레이브 레지스터 쓰기 2번
    #0 SA0 = 1'b1;
    #0 nSCS = 1'b0;
    #0 slaveDataReg = 4'b1010;
    #1 slave_data_reg_write = 1'b0;
    #2 nSWR = 1'b0;
    #2 nSWR = 1'b1;
    #1 nSCS = 1'b0;
    #0 slave_data_reg_write = 1'b1;

    //cycle 26 = 1660ns: 슬레이브 레지스터 쓰기 3번
    #0 SA0 = 1'b1;
    #0 nSCS = 1'b0;
    #0 slaveDataReg = 4'b1011;
    #1 slave_data_reg_write = 1'b0;
    #2 nSWR = 1'b0;
    #2 nSWR = 1'b1;
    #1 nSCS = 1'b0;
    #0 slave_data_reg_write = 1'b1;

    //cycle 27 = 1720ns: 슬레이브 레지스터 읽기 4번
    #0 SA0 = 1'b1;
    #0 nSCS = 1'b0;
    #1 nSRD = 1'b0;
    #4 nSRD = 1'b1;
    #1 nSCS = 1'b0;
    
    //cycle 28 = 1780ns: 마스터 레지스터 읽기 4번
    #0 MA0 = 1'b1;
    #0 nMCS = 1'b0;
    #1 nMRD = 1'b0;
    #4 nMRD = 1'b1;
    #1 nMCS = 1'b0;

    //cycle 29 = 1840ns: 마스터 페이지 레지스터 쓰기 (0으로 돌림)
    #0 MA0 = 1'b0;
    #0 nMCS = 1'b0;
    #0 masterDataReg = 4'b0000;
    #1 master_data_reg_write = 1'b0;
    #2 nMWR = 1'b0;
    #2 nMWR = 1'b1;
    #1 nMCS = 1'b0;
    #0 master_data_reg_write = 1'b1;

    //cycle 30 = 1900ns: 마스터 레지스터 읽기 0번
    #0 MA0 = 1'b1;
    #0 nMCS = 1'b0;
    #1 nMRD = 1'b0;
    #4 nMRD = 1'b1;
    #1 nMCS = 1'b0;

    //cycle 31 = 1960ns: 마스터 레지스터 읽기 1번
    #0 MA0 = 1'b1;
    #0 nMCS = 1'b0;
    #1 nMRD = 1'b0;
    #4 nMRD = 1'b1;
    #1 nMCS = 1'b0;

    //cycle 32 = 2120ns: 마스터 레지스터 읽기 2번
    #0 MA0 = 1'b1;
    #0 nMCS = 1'b0;
    #1 nMRD = 1'b0;
    #4 nMRD = 1'b1;
    #1 nMCS = 1'b0;

    //cycle 33 = 2180ns: 마스터 레지스터 읽기 3번
    #0 MA0 = 1'b1;
    #0 nMCS = 1'b0;
    #1 nMRD = 1'b0;
    #4 nMRD = 1'b1;
    #1 nMCS = 1'b0;

    //cycle 34 = 2240ns: 마스터 레지스터 읽기 4번
    #0 MA0 = 1'b1;
    #0 nMCS = 1'b0;
    #1 nMRD = 1'b0;
    #4 nMRD = 1'b1;
    #1 nMCS = 1'b0;
end
endmodule