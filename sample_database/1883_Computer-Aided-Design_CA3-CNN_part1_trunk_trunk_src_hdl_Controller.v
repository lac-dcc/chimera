// This program was cloned from: https://github.com/kasrahj/Computer-Aided-Design
// License: MIT License

module Controller #(parameter N = 4)(
    input clk, rst,
    input start,
    output reg ready ,writeEnbuff, writeEnmem, wEnWindow, rEnConv, ldConvDone, addEn, winRst,wrofm,
    output reg [5:0] buffCount, filtertemp, winCount, convCount,
    output reg [9:0] memAddress,
    output reg [5:0] buffAddress,
    output reg [7:0] ofmaddr,
    output reg [N-1:0] writeEnFilter
  );

  // localparam X = 9'd5, Y = 9'd71, Z = 9'd83; //input2
  // localparam X = 9'd2, Y = 9'd71, Z = 9'd81; //input
  // localparam X = 9'd8, Y = 9'd, Z = 9'd82; //input3
  localparam X = 9'd16, Y = 9'd0, Z = 9'd0; //correct
  reg [5:0]  buffToWinCount, memToBuffCount;
  // localparam Idle = 4'd0, Init = 4'd1, LoadFilter1 = 4'd2, LoadFilter2 = 4'd3 , LoadFilter3 = 4'd4 ,
  //            LoadFilter4 = 4'd5, LoadBuff = 4'd6,
  //            LoadFirstWin = 4'd7, LoadRemWin = 4'd8, LoadConv = 4'd9, Write = 4'd10,
  //            Done = 4'd11, ConvHold = 4'd12, LastConvHold = 4'd13, LastWrite = 4'd14;
  localparam Idle = 4'd0, Init = 4'd1, LoadFilter = 4'd2, LoadBuff = 4'd3,
             LoadFirstWin = 4'd4, LoadRemWin = 4'd5, LoadConv = 4'd6, Write = 4'd7,
             Done = 4'd8, ConvHold = 4'd9, LastConvHold = 4'd10, LastWrite = 4'd11;

  wire ldBuffDone, ldFilterDone, ldWinDone, gotAllWin, gotAllBuff, gotallfilter;
  reg [5:0] filternumber;
  reg [5:0] filterCount;
  reg wEnFilter;


  reg [3:0] pstate, nstate;

  always @(pstate or start or ldBuffDone or ldFilterDone, ldWinDone, ldConvDone)
  begin
    nstate = Idle;
    case (pstate)
      Idle:
        nstate = start ? Init : Idle;
      Init:
        nstate = start ? Init : LoadFilter;
      // LoadFilter1:  //new states
      //   nstate =  LoadFilter2;
      // LoadFilter2:
      //   nstate =  LoadFilter3;
      // LoadFilter3:
      //   nstate =  LoadFilter4;
      // LoadFilter4:
      //   nstate = ldFilterDone ? LoadBuff : LoadFilter1;
      LoadFilter:
        nstate = (ldFilterDone && gotallfilter) ? LoadBuff : LoadFilter;
      LoadBuff:
        nstate = ldBuffDone ? (gotAllBuff ? Done : LoadFirstWin) : LoadBuff;
      LoadFirstWin:
        nstate = ldWinDone ? LoadConv : LoadFirstWin;
      LoadConv:
        nstate =  ldConvDone ? (gotAllWin ? LastConvHold : ConvHold) : LoadConv;
      LastConvHold:
        nstate = LastWrite;
      LastWrite:
        nstate = LoadBuff;
      ConvHold:
        nstate = Write;
      Write:
        nstate = LoadRemWin;
      LoadRemWin:
        nstate = LoadConv;
      Done:
        nstate = Done;
      default:
        ;
    endcase
  end

  always @(pstate)
  begin
    {wEnFilter, writeEnbuff, wEnWindow, rEnConv, writeEnmem, addEn, winRst, ready, wrofm} = 9'd0;
    case (pstate)
      // LoadFilter1:
      // begin
      //   wEnFilter = 1'd1;
      // end
      // LoadFilter2:  
      // begin
      //   wEnFilter = 1'd1;
      // end
      // LoadFilter3:
      // begin
      //   wEnFilter = 1'd1;
      // end
      // LoadFilter4:
      // begin
      //   wEnFilter = 1'd1;
      // end
      Init:
      begin
        filternumber <= 0;
      end
      LoadFilter:
      begin
        wEnFilter = 1'd1;
        writeEnFilter <= 1;
      end
      LoadBuff:
      begin
        // rEnMem = 1'd1;
        writeEnbuff = 1'd1;
        memToBuffCount <= memToBuffCount + 1;
        buffToWinCount <= 0;
      end
      LoadFirstWin:
      begin
        wEnWindow = 1'd1;
        buffToWinCount = buffToWinCount + 1;
      end
      LoadRemWin:
      begin
        wEnWindow = 1'd1;
        buffToWinCount = buffToWinCount + 1;
      end
      LoadConv:
      begin
        rEnConv = 1'd1;
        addEn = 1'd1;
      end
      ConvHold:
      begin
        addEn = 1'd1;
      end
      Write:
      begin
        addEn = 1'd1;
        wrofm = 1'd1;
        winRst = 1'd1;
      end
      LastConvHold:
      begin
        addEn = 1'd1;
      end
      LastWrite:
      begin
        addEn = 1'd1;
        wrofm = 1'd1;
        winRst = 1'd1;
      end
      Done:
      begin
        {wEnFilter, writeEnbuff, wEnWindow, rEnConv} = 4'd0;
        ready = 1'd1;
      end
    endcase
  end

  // always @(posedge clk)
  // begin
  //   if (rst || (wEnFilter == 0))
  //     writeEnFilter <= 0;
  //   else if (wEnFilter && filtertemp == 0)
  //   begin
  //     if(writeEnFilter == 0)
  //       writeEnFilter <= 1;
  //     else 
  //       writeEnFilter <= writeEnFilter * 2;
  //   end
  // end

   always @(posedge clk)
  begin
    if (rst || (wEnFilter == 0))
      writeEnFilter <= 0;
    else if (wEnFilter && filtertemp == 3)
    begin
        writeEnFilter <= writeEnFilter * 2;
    end
  end


  always @(posedge clk or posedge rst)
  begin
    if (rst)
    begin
      pstate <= Idle;
      buffToWinCount <= 0;
      memToBuffCount <= 0;
      filternumber <= 0;
    end
    else
      pstate <= nstate;
  end

  always @(posedge clk)
  begin
    if (rst)
      buffCount <= 8'b0;
    else if (buffCount == 8'd15)
    begin
      buffCount <= 8'b0;
    end
    else if (writeEnbuff)
      buffCount <= buffCount + 1;
  end

  always @(posedge clk)
  begin
    if (rst)
      filterCount <= 8'b0;
    else if (gotallfilter)
      filterCount <= 8'b0;
    else if (wEnFilter)
      filterCount <= filterCount + 1;
  end
  // new filtertemp
    always @(posedge clk)
  begin
    if (rst)
      filtertemp <= 8'b0;
    else if (filtertemp == 8'd3)
    begin
      filtertemp <= 8'b0;
      filternumber <= filternumber + 1;
    end
    else if (wEnFilter)
      filtertemp <= filtertemp + 1;
  end

  always @(posedge clk)
  begin
    if (rst)
      winCount <= 8'b0;
    else if (winCount == 8'd3)
      winCount <= 8'b0;
    else if (wEnWindow)
      winCount <= winCount + 1;
  end

  always @(posedge clk)
  begin
    if (rst)
      convCount <= 8'b0;
    else if (convCount == 8'd16)
      convCount <= 8'b0;
    else if (rEnConv)
      convCount <= convCount + 1;
  end

  assign ldFilterDone = (filtertemp == 8'd3);
  assign ldBuffDone = (buffCount == 8'd15);
  assign ldWinDone = (winCount == 8'd3);
  assign ldConvDone = (convCount == 8'd16);
  assign gotAllWin = (buffToWinCount == 8'd13);
  assign gotAllBuff = (memToBuffCount == 8'd14);
  assign gotallfilter = (filternumber == N); 

  always @(*)
  begin
    if (writeEnbuff)
      memAddress = X + (memToBuffCount - 1) * 4 + buffCount;
    else if (wEnFilter)
      memAddress = Y + filterCount;
    else if (wrofm)
      ofmaddr = Z * 4 + (memToBuffCount - 1) * 13 + buffToWinCount - 1;
    else if(wrofm == 0)
      ofmaddr = 0;
    else
      memAddress = 0;
  end

  always @(*)
  begin
    if (writeEnbuff)
      buffAddress = buffCount;
    else if (wEnWindow)
    begin
      if (pstate == LoadFirstWin)
        buffAddress = winCount;
      else if (pstate == LoadRemWin)
        buffAddress = 2 + buffToWinCount;
    end
    else
      buffAddress = 0;
  end

endmodule
