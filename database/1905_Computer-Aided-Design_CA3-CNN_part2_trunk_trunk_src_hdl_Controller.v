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
    output reg [N-1:0] writeEnFilter,

    //l2
    output reg writeEnbuff_l2, wEnWindow_l2, rEnConv_l2, addEN_l2, winRst_l2,wrofm_l2,
    output reg [3:0] writeEnFilter_l2,
    output reg [5:0] filtertemp_l2, convCount_l2, buffAddress_l2,
    output reg [7:0] ofmaddr_l2    
  );

  // localparam X = 9'd5, Y = 9'd71, Z = 9'd83; //input2
  // localparam X = 9'd2, Y = 9'd71, Z = 9'd81; //input
  // localparam X = 9'd8, Y = 9'd, Z = 9'd82; //input3
  localparam X = 9'd16, Y = 9'd0, Z = 9'd70, M = 9'd0; //correct
  reg [5:0]  buffToWinCount, memToBuffCount;

  // localparam Idle = 4'd0, Init = 4'd1, LoadFilter1 = 4'd2, LoadFilter2 = 4'd3 , LoadFilter3 = 4'd4 ,
  //            LoadFilter4 = 4'd5, LoadBuff = 4'd6,
  //            LoadFirstWin = 4'd7, LoadRemWin = 4'd8, LoadConv = 4'd9, Write = 4'd10,
  //            Done = 4'd11, ConvHold = 4'd12, LastConvHold = 4'd13, LastWrite = 4'd14;
  localparam Idle = 5'd0, Init = 5'd1, LoadFilter = 5'd2, LoadBuff = 5'd3,
             LoadFirstWin = 5'd4, LoadRemWin = 5'd5, LoadConv = 5'd6, Write = 5'd7,
             Done = 5'd8, ConvHold = 5'd9, LastConvHold = 5'd10, LastWrite = 5'd11, Init_l2 = 5'd12, LoadFilter_l2 = 5'd13,
             LoadBuff_l2 = 5'd14, LoadFirstWin_l2 = 5'd15, LoadRemWin_l2 = 5'd16, LoadConv_l2 = 5'd17, Write_l2 = 5'd18,
             ConvHold_l2 = 5'd19, LastConvHold_l2 = 5'd20, LastWrite_l2 = 5'd21;

  wire ldBuffDone, ldFilterDone, ldWinDone, gotAllWin, gotAllBuff, gotallfilter;
  reg [5:0] filternumber;
  reg [5:0] filterCount;
  reg wEnFilter;

  //new signals
  wire ldBuffDone_l2, ldFilterDone_l2, ldWinDone_l2, gotAllWin_l2, gotAllBuff_l2, gotallfilter_l2;
  reg [5:0] filternumber_l2;
  reg [5:0] filterCount_l2;
  reg wEnFilter_l2;
  reg [5:0]  buffToWinCount_l2, memToBuffCount_l2;
  reg [5:0] buffCount_l2,winCount_l2;
  


  reg [4:0] pstate, nstate;

  always @(pstate or start or ldBuffDone or ldFilterDone or ldWinDone or ldConvDone or ldBuffDone_l2 or ldFilterDone_l2 or ldWinDone_l2 or ldConvDone_l2)
  begin
    nstate = Idle;
    case (pstate)
      Idle:
        nstate = start ? Init : Idle;
      Init:
        nstate = start ? Init : LoadFilter;
      LoadFilter:
        nstate = (ldFilterDone && gotallfilter) ? LoadBuff : LoadFilter;
      LoadBuff:
        nstate = ldBuffDone ? (gotAllBuff ? Init_l2 : LoadFirstWin) : LoadBuff;
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
      //new states
      Init_l2:
        nstate = LoadFilter_l2;
      LoadFilter_l2:
        nstate = (ldFilterDone_l2 && gotallfilter_l2) ? LoadBuff_l2 : LoadFilter_l2; //change
      LoadBuff_l2:
        nstate = ldBuffDone_l2 ? (gotAllBuff_l2 ? Done : LoadFirstWin_l2) : LoadBuff_l2;
      LoadFirstWin_l2:
        nstate = ldWinDone_l2 ? LoadConv_l2 : LoadFirstWin_l2;
      LoadConv_l2:
        nstate =  ldConvDone_l2 ? (gotAllWin_l2 ? LastConvHold_l2 : ConvHold_l2) : LoadConv_l2;
      LastConvHold_l2:
        nstate = LastWrite_l2;
      LastWrite_l2:
        nstate = LoadBuff_l2;
      ConvHold_l2:
        nstate = Write_l2;
      Write_l2:
        nstate = LoadRemWin_l2;
      LoadRemWin_l2:
        nstate = LoadConv_l2;
      Done:
        nstate = Done;
      default:
        ;
    endcase
  end

  always @(pstate)
  begin
    {wEnFilter, writeEnbuff, wEnWindow, rEnConv, writeEnmem, addEn, winRst, ready, wrofm,
     wEnFilter_l2, writeEnbuff_l2, wEnWindow_l2, rEnConv_l2, addEN_l2, winRst_l2, wrofm_l2} = 16'd0;
    case (pstate)
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
      //new states
      Init_l2:
      begin
        filternumber_l2 <= 0;
      end
      LoadFilter_l2:
      begin
        wEnFilter_l2 = 1'd1;
        writeEnFilter_l2 <= 1;
      end
      LoadBuff_l2:
      begin
        // rEnMem = 1'd1;
        writeEnbuff_l2 = 1'd1;
        memToBuffCount_l2 <= memToBuffCount_l2 + 1;
        buffToWinCount_l2 <= 0;
      end
      LoadFirstWin_l2:
      begin
        wEnWindow_l2 = 1'd1;
        buffToWinCount_l2 = buffToWinCount_l2 + 1;
      end
      LoadRemWin_l2:
      begin
        wEnWindow_l2 = 1'd1;
        buffToWinCount_l2 = buffToWinCount_l2 + 1;
      end
      LoadConv_l2:
      begin
        rEnConv_l2 = 1'd1;
        addEN_l2 = 1'd1;
      end
      ConvHold_l2:
      begin
        addEN_l2 = 1'd1;
      end
      Write_l2:
      begin
        addEN_l2 = 1'd1;
        wrofm_l2 = 1'd1;
        winRst_l2 = 1'd1;
      end
      LastConvHold_l2:
      begin
        addEN_l2 = 1'd1;
      end
      LastWrite_l2:
      begin
        addEN_l2 = 1'd1;
        wrofm_l2 = 1'd1;
        winRst_l2 = 1'd1;
      end
      Done:
      begin
        {wEnFilter, writeEnbuff, wEnWindow, rEnConv, wEnFilter_l2, writeEnbuff_l2, wEnWindow_l2, rEnConv_l2} = 8'd0;
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
  //l2
    always @(posedge clk)
  begin
    if (rst || (wEnFilter_l2 == 0))
      writeEnFilter_l2 <= 0;
    else if (wEnFilter_l2 && filtertemp_l2 == 3)
    begin
        writeEnFilter_l2 <= writeEnFilter_l2 * 2;
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
      buffToWinCount_l2 <= 0;
      memToBuffCount_l2 <= 0;
      filternumber_l2 <= 0;
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
  //l2
  always @(posedge clk)
  begin
    if (rst)
      buffCount_l2 <= 8'b0;
    else if (buffCount_l2 == 8'd15)
    begin
      buffCount_l2 <= 8'b0;
    end
    else if (writeEnbuff_l2)
      buffCount_l2 <= buffCount_l2 + 1;
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
  //l2
    always @(posedge clk)
  begin
    if (rst)
      filterCount_l2 <= 8'b0;
    else if (gotallfilter_l2)
      filterCount_l2 <= 8'b0;
    else if (wEnFilter_l2)
      filterCount_l2 <= filterCount_l2 + 1;
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
  //l2
    always @(posedge clk)
  begin
    if (rst)
      filtertemp_l2 <= 8'b0;
    else if (filtertemp_l2 == 8'd3)
    begin
      filtertemp_l2 <= 8'b0;
      filternumber_l2 <= filternumber_l2 + 1;
    end
    else if (wEnFilter_l2)
      filtertemp_l2 <= filtertemp_l2 + 1;
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
  //l2
    always @(posedge clk)
  begin
    if (rst)
      winCount_l2 <= 8'b0;
    else if (winCount_l2 == 8'd3)
      winCount_l2 <= 8'b0;
    else if (wEnWindow_l2)
      winCount_l2 <= winCount_l2 + 1;
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
  //l2
    always @(posedge clk)
  begin
    if (rst)
      convCount_l2 <= 8'b0;
    else if (convCount_l2 == 8'd16)
      convCount_l2 <= 8'b0;
    else if (rEnConv_l2)
      convCount_l2 <= convCount_l2 + 1;
  end

  assign ldFilterDone = (filtertemp == 8'd3);
  assign ldBuffDone = (buffCount == 8'd15);
  assign ldWinDone = (winCount == 8'd3);
  assign ldConvDone = (convCount == 8'd16);
  assign gotAllWin = (buffToWinCount == 8'd13);
  assign gotAllBuff = (memToBuffCount == 8'd10);
  assign gotallfilter = (filternumber == N); 
  //l2
  assign ldFilterDone_l2 = (filtertemp_l2 == 8'd3);
  assign ldBuffDone_l2 = (buffCount_l2 == 8'd15);
  assign ldWinDone_l2 = (winCount_l2 == 8'd3);
  assign ldConvDone_l2 = (convCount_l2 == 8'd16);
  assign gotAllWin_l2 = (buffToWinCount_l2 == 8'd13);
  assign gotAllBuff_l2 = (memToBuffCount_l2 == 8'd10);
  assign gotallfilter_l2 = (filternumber_l2 == 4); 

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

  //l2
    always @(*)
  begin
    if (writeEnbuff_l2) //check
      ofmaddr = Z + (memToBuffCount_l2 - 1) * 4 + buffCount_l2;
    else if (wEnFilter_l2)
      ofmaddr = Y + filterCount_l2;
    else if (wrofm_l2)
      ofmaddr_l2 = (memToBuffCount_l2 - 1) * 13 + buffToWinCount_l2 - 1;
    else if(wrofm_l2 == 0)
      ofmaddr_l2 = 0;
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

  //l2
    always @(*)
  begin
    if (writeEnbuff_l2)
      buffAddress_l2 = buffCount_l2;
    else if (wEnWindow_l2)
    begin
      if (pstate == LoadFirstWin_l2)
        buffAddress_l2 = winCount_l2;
      else if (pstate == LoadRemWin_l2)
        buffAddress_l2 = 2 + buffToWinCount_l2;
    end
    else
      buffAddress_l2 = 0;
  end

endmodule
