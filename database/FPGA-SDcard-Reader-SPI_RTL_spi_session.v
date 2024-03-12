
//--------------------------------------------------------------------------------------------------------
// Module  : spi_session
// Type    : synthesizable, IP's sub module
// Standard: Verilog 2001 (IEEE1364-2001)
//--------------------------------------------------------------------------------------------------------

module spi_session (
    input  wire         rstn,
    input  wire         clk,
    // spi interface
    output reg          spi_ssn, spi_sck, spi_mosi,
    input  wire         spi_miso,
    // user command interface
    input  wire         start, 
    output wire         done,
    input  wire  [31:0] clkdiv, // next command spi_sck = clk / (2*(clkdiv+1)), for example clk=50MHz, clkdiv=124, spi_sck=50MHz/(2*125) = 200kHz
    input  wire  [47:0] cmd, acmd,
    input  wire  [ 7:0] waitcycle, precycle, startcycle, cmdcycle, cmdrcycle, acmdcycle, acmdrcycle, midcycle, stopcycle, recycle, // dummy clock byte cycles
    output reg   [ 7:0] cmdrsp, acmdrsp, rwrsp,
    output reg   [47:0] cmdres, acmdres,
    // data readout
    output reg          rvalid,
    output reg   [15:0] rindex,
    output reg   [ 7:0] rdata
);


initial {cmdrsp, acmdrsp, rwrsp} = 0;
initial {cmdres, acmdres} = 0;
initial {spi_ssn, spi_sck, spi_mosi} = 3'b111;
initial {rvalid, rdata, rindex} = 0;

reg   start_last=1'b0;
reg   [31:0] clkdivreg=0, cyccnt=0;
reg   [ 2:0] bitcnt=3'b0;
reg   highlow=1'b0;
wire  byteend, bytestart;
reg   scken=1'b0, chipselect=1'b0;
reg   [ 7:0] wbyte=8'hff, rbyte=8'h0;
reg   [47:0] cmdr=48'h0, acmdr=48'h0;
reg   [ 7:0] waitc=8'h0, prec=8'h0, startc=8'h0, cmdc=8'h0, cmdrwait=8'h0, cmdrc=8'h0, acmdc=8'h0, acmdrwait=8'h0, acmdrc=8'h0, midc=8'h0, stopc=8'h0, rec=8'h0, lastc=8'h0;
reg   [15:0] rwc = 16'h0;
reg   iscmdr=1'b0, isacmdr=1'b0, iscmdres=1'b0, isacmdres=1'b0,ismidc=1'b0, isrwc=1'b0;

assign byteend   = (cyccnt==0) && ({bitcnt,highlow}==4'h0) ;
assign bytestart = (cyccnt==1) && ({bitcnt,highlow}==4'h0) ;

assign done = start && start_last && (lastc==8'h0);

always @ (posedge clk or negedge rstn)
    if(~rstn) begin
        cyccnt <= 0;
        {bitcnt,highlow} <= 3'h0;
        {spi_ssn, spi_sck, spi_mosi} <= 3'b111;
        rbyte <= 8'h0;
    end else begin
        if(~start) begin
            cyccnt <= 0;
            {bitcnt,highlow} <= 3'h0;
            {spi_ssn, spi_sck, spi_mosi} <= 3'b111;
            rbyte <= 8'h0;
        end else if(cyccnt<clkdivreg) begin
            cyccnt <= cyccnt + 1;
        end else begin
            spi_ssn <= ~chipselect;
            spi_sck <= scken ? highlow : 1'b1;
            if(highlow)                                    // posedge of spi_sck, capture spi_miso
                rbyte[7-bitcnt] <= spi_miso;
            else                                           // negedge of spi_sck, set spi_mosi
                spi_mosi <= wbyte[7-bitcnt];
            {bitcnt,highlow} <= {bitcnt,highlow} + 3'h1;
            cyccnt <= 0;
        end
    end

always @ (posedge clk or negedge rstn)
    if(~rstn) begin
        start_last   <= 1'b0;
        clkdivreg    <= 0;
        {cmdr,acmdr} <= 0;
        {cmdrsp, acmdrsp, rwrsp} <= 0;
        {cmdres, acmdres} <= 0;
        {waitc,prec,startc,cmdc,cmdrwait,cmdrc,acmdc,acmdrwait,acmdrc,midc,rwc,stopc,rec,lastc} <= 0;
        {iscmdr, isacmdr,iscmdres,isacmdres,ismidc,isrwc} <= 0;
        {chipselect,scken,wbyte} <= {2'b00, 8'hff};
        {rvalid, rdata, rindex} <= 0;
    end else begin
        {rvalid, rdata, rindex} <= 0;
        if(~start) begin
            start_last   <= 1'b0;
            clkdivreg    <= 0;
            {cmdr,acmdr} <= 0;
            {cmdrsp, acmdrsp, rwrsp} <= 0;
            {cmdres, acmdres} <= 0;
            {waitc,prec,startc,cmdc,cmdrwait,cmdrc,acmdc,acmdrwait,acmdrc,midc,rwc,stopc,rec,lastc} <= 0;
            {iscmdr, isacmdr,iscmdres,isacmdres,ismidc,isrwc} <= 0;
            {chipselect,scken,wbyte} <= {2'b00, 8'hff};
        end else if(~start_last) begin
            start_last   <= 1'b1;
            clkdivreg    <= clkdiv<2 ? 2 : clkdiv;
            {cmdr,acmdr} <= {cmd, acmd};
            {cmdrsp, acmdrsp, rwrsp} <= 0;
            {cmdres, acmdres} <= 0;
            {waitc,prec,startc,cmdc,cmdrwait,cmdrc,acmdc,acmdrwait,acmdrc,midc,rwc,stopc,rec,lastc} <= {waitcycle,precycle,startcycle,cmdcycle,(cmdcycle>0)?8'h20:8'h0,cmdrcycle,acmdcycle,(acmdcycle>0)?8'h20:8'h0,acmdrcycle,midcycle,(midcycle>0)?16'd514:16'd0,stopcycle,recycle,8'h2};
            {iscmdr, isacmdr,iscmdres,isacmdres,ismidc,isrwc} <= 0;
            {chipselect,scken,wbyte} <= {2'b00, 8'hff};
        end else if(bytestart) begin
            if         (waitc>0) begin
                waitc <= waitc - 8'd1;
                {chipselect,scken,wbyte} <= {2'b00, 8'hff};
            end else if(prec>0) begin
                prec <= prec - 8'd1;
                {chipselect,scken,wbyte} <= {2'b01, 8'hff};
            end else if(startc>0) begin
                startc <= startc - 8'd1;
                {chipselect,scken,wbyte} <= {2'b11, 8'hff};
            end else if(cmdc>0) begin
                cmdc <= cmdc - 8'd1;
                {chipselect,scken,wbyte} <= {2'b11, cmdr[(cmdc-8'd1)*8+:8]};
            end else if(cmdrwait>0) begin     iscmdr <= 1'b1;
                cmdrwait <= cmdrwait - 8'd1;
                {chipselect,scken,wbyte} <= {2'b11, 8'hff};
            end else if(cmdrc>0) begin        iscmdres <= 1'b1;
                cmdrc <= cmdrc - 8'd1;
                {chipselect,scken,wbyte} <= {2'b11, 8'hff};
            end else if(acmdc>0) begin
                acmdc <= acmdc - 8'd1;
                {chipselect,scken,wbyte} <= {2'b11, acmdr[(acmdc-8'd1)*8+:8]};
            end else if(acmdrwait>0) begin    isacmdr <= 1'b1;
                acmdrwait <= acmdrwait - 8'd1;
                {chipselect,scken,wbyte} <= {2'b11, 8'hff};
            end else if(acmdrc>0) begin       isacmdres <= 1'b1;
                acmdrc <= acmdrc - 8'd1;
                {chipselect,scken,wbyte} <= {2'b11, 8'hff};
            end else if(midc>0) begin         ismidc <= 1'b1;
                midc <= midc - 8'd1;
                {chipselect,scken,wbyte} <= {2'b11, 8'hff};
            end else if(rwc>0) begin          isrwc  <= 1'b1;
                rwc <= rwc - 16'd1;
                {chipselect,scken,wbyte} <= {2'b11, 8'hff};
            end else if(stopc>0) begin
                stopc <= stopc - 8'd1;
                {chipselect,scken,wbyte} <= {2'b11, 8'hff};
            end else if(rec>0) begin
                rec <= rec - 8'd1;
                {chipselect,scken,wbyte} <= {2'b01, 8'hff};
            end else if(lastc>0) begin
                lastc <= lastc - 8'd1;
                {chipselect,scken,wbyte} <= {2'b00, 8'hff};
            end else begin
                {chipselect,scken,wbyte} <= {2'b00, 8'hff};
            end
        end else if(byteend) begin
            if(iscmdr && ~rbyte[7]) begin
                cmdrsp    <= rbyte;
                cmdrwait  = 8'd0;
            end
            if( iscmdres) cmdres[cmdrc*8+:8] <= rbyte;
            if(isacmdr && ~rbyte[7]) begin
                acmdrsp   <= rbyte;
                acmdrwait <= 8'd0;
            end
            if(isacmdres) acmdres[acmdrc*8+:8] <= rbyte;
            if(ismidc && rbyte==8'hFE) begin
                rwrsp <= rbyte;
                midc  <= 8'd0;
            end
            if(isrwc) begin
                {rvalid, rdata} <= {1'b1, rbyte};
                rindex <= rwc;
            end
            {iscmdr, isacmdr,iscmdres,isacmdres,ismidc,isrwc} <= 0;
        end
    end

endmodule
