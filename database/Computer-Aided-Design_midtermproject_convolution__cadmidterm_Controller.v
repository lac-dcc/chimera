// This program was cloned from: https://github.com/kasrahj/Computer-Aided-Design
// License: MIT License

module Controller (
    input clk, rst,
    input start,
    output reg ready ,writeEnbuff, writeEnmem, wEnFilter, wEnWindow, rEnConv, ldConvDone, addEn, winRst,
    output reg [5:0] buffCount, filterCount, winCount, convCount,
    output reg [9:0] memAddress,
    output reg [5:0] buffAddress
  );

  localparam X = 9'd5, Y = 9'd71, Z = 9'd83;
  // localparam X = 9'd2, Y = 9'd71, Z = 9'd81;
  // localparam X = 9'd, Y = 9'd71, Z = 9'd83;

    reg [5:0]  buffToWinCount, memToBuffCount;


  localparam Idle = 4'd0, Init = 4'd1, LoadFilter = 4'd2, LoadBuff = 4'd3,
             LoadFirstWin = 4'd4, LoadRemWin = 4'd5, LoadConv = 4'd6, Write = 4'd7,
             Done = 4'd8, ConvHold = 4'd9, LastConvHold = 4'd10, LastWrite = 4'd11;

  wire ldBuffDone, ldFilterDone, ldWinDone, gotAllWin, gotAllBuff;

  reg [3:0] pstate, nstate;

  always @(pstate or start or ldBuffDone or ldFilterDone, ldWinDone, ldConvDone)
  begin
    nstate = Idle;
    case (pstate)
      Idle:
        nstate = start ? Init : Idle;
      Init:
        nstate = start ? Init : LoadFilter;
      LoadFilter:
        nstate = ldFilterDone ? LoadBuff : LoadFilter;
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
    {wEnFilter, writeEnbuff, wEnWindow, rEnConv, writeEnmem, addEn, winRst, ready} = 8'd0;
    case (pstate)
      LoadFilter:
      begin
        // rEnMem = 1'd1;
        wEnFilter = 1'd1;
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
        writeEnmem = 1'd1;
        winRst = 1'd1;
      end
      LastConvHold:
      begin
        addEn = 1'd1;
      end
      LastWrite:
      begin
        addEn = 1'd1;
        writeEnmem = 1'd1;
        winRst = 1'd1;
      end
      Done:
      begin
        {wEnFilter, writeEnbuff, wEnWindow, rEnConv} = 4'd0;
        ready = 1'd1;
      end
    endcase
  end

  always @(posedge clk or posedge rst)
  begin
    if (rst)
    begin
      pstate <= Idle;
      buffToWinCount <= 0;
      memToBuffCount <= 0;
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
    else if (filterCount == 8'd3)
      filterCount <= 8'b0;
    else if (wEnFilter)
      filterCount <= filterCount + 1;
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


  assign ldFilterDone = (filterCount == 8'd3);
  assign ldBuffDone = (buffCount == 8'd15);
  assign ldWinDone = (winCount == 8'd3);
  assign ldConvDone = (convCount == 8'd16);
  assign gotAllWin = (buffToWinCount == 8'd13);
  assign gotAllBuff = (memToBuffCount == 8'd14);

  always @(*)
  begin
    if (writeEnbuff)
      memAddress = X + (memToBuffCount - 1) * 4 + buffCount;
    else if (wEnFilter)
      memAddress = Y + filterCount;
    else if (writeEnmem)
      memAddress = Z * 4 + (memToBuffCount - 1) * 13 + buffToWinCount - 1;
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
