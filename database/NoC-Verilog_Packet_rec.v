module Packet_rec (input clk, reset, end_sim, write, input [63:0] Flit, output reg push_ack, input [2:0] X_cur, Y_cur);
  
  
  reg [1:0] seq;
  reg [19:0] addr;
  reg [305:0] M [0:20000];
  reg [49:0] cnt;
  reg en;
  integer handle;
  integer desc;
  integer ID;
  integer i;
  integer temp;
  always @(*)
  begin
    if(end_sim == 1)
    begin
      ID = Y_cur*8 + X_cur;
      case (ID)
        0:  handle = $fopen("out/0.out"); 
        1:  handle = $fopen("out/1.out");  
        2:  handle = $fopen("out/2.out"); 
        3:  handle = $fopen("out/3.out"); 
        4:  handle = $fopen("out/4.out"); 
        5:  handle = $fopen("out/5.out"); 
        6:  handle = $fopen("out/6.out"); 
        7:  handle = $fopen("out/7.out"); 
        8:  handle = $fopen("out/8.out"); 
        9:  handle = $fopen("out/9.out"); 
        10: handle = $fopen("out/10.out"); 
        11: handle = $fopen("out/11.out"); 
        12: handle = $fopen("out/12.out"); 
        13: handle = $fopen("out/13.out"); 
        14: handle = $fopen("out/14.out"); 
        15: handle = $fopen("out/15.out"); 
        16: handle = $fopen("out/16.out"); 
        17: handle = $fopen("out/17.out"); 
        18: handle = $fopen("out/18.out"); 
        19: handle = $fopen("out/19.out"); 
        20: handle = $fopen("out/20.out"); 
        21: handle = $fopen("out/21.out"); 
        22: handle = $fopen("out/22.out"); 
        23: handle = $fopen("out/23.out"); 
        24: handle = $fopen("out/24.out"); 
        25: handle = $fopen("out/25.out"); 
        26: handle = $fopen("out/26.out"); 
        27: handle = $fopen("out/27.out"); 
        28: handle = $fopen("out/28.out"); 
        29: handle = $fopen("out/29.out"); 
        30: handle = $fopen("out/30.out"); 
        31: handle = $fopen("out/31.out"); 
        32: handle = $fopen("out/32.out"); 
        33: handle = $fopen("out/33.out"); 
        34: handle = $fopen("out/34.out"); 
        35: handle = $fopen("out/35.out"); 
        36: handle = $fopen("out/36.out"); 
        37: handle = $fopen("out/37.out"); 
        38: handle = $fopen("out/38.out"); 
        39: handle = $fopen("out/39.out"); 
        40: handle = $fopen("out/40.out"); 
        41: handle = $fopen("out/41.out"); 
        42: handle = $fopen("out/42.out"); 
        43: handle = $fopen("out/43.out"); 
        44: handle = $fopen("out/44.out"); 
        45: handle = $fopen("out/45.out"); 
        46: handle = $fopen("out/46.out"); 
        47: handle = $fopen("out/47.out"); 
        48: handle = $fopen("out/48.out"); 
        49: handle = $fopen("out/49.out"); 
        50: handle = $fopen("out/50.out"); 
        51: handle = $fopen("out/51.out"); 
        52: handle = $fopen("out/52.out"); 
        53: handle = $fopen("out/53.out"); 
        54: handle = $fopen("out/54.out"); 
        55: handle = $fopen("out/55.out"); 
        56: handle = $fopen("out/56.out"); 
        57: handle = $fopen("out/57.out"); 
        58: handle = $fopen("out/58.out"); 
        59: handle = $fopen("out/59.out"); 
        60: handle = $fopen("out/60.out"); 
        61: handle = $fopen("out/61.out"); 
        62: handle = $fopen("out/62.out"); 
        63: handle = $fopen("out/63.out"); 
      endcase
      for(i = 0; i < addr; i = i + 1)
      begin
    //    temp = M[i][194:192] + M[i][197:195] * 8;
//M[i][255:192]
        $fdisplay(handle,"%0d \t %b",M[i][305:256],M[i][255:192]);
      end
      $fclose(handle);
      #100000
      i = 0;
    end
  end
  
  always @(*)
  begin
    push_ack = write;
  end
  
  always @(posedge clk)
  begin
    if(reset)
    begin
      en = 0;
      seq = 0;
      addr = 0;
      cnt = 50'h3ffffffffffff;
    end
    else
    begin
      cnt = cnt + 1;
    //  $display(addr);
      if(write == 1)
      begin
        if(seq == 2'b00)
        begin
          if(Flit[63:62] == 2'b11 && X_cur == 3)// && Flit[2:0] == 3'b001)
          begin
            en = 1;
      //      $display("%b",Flit);
          end
          M[addr][305:256]= cnt;
          M[addr][255:192] = Flit;
          seq = seq + 1;
        end
        else if(seq == 2'b01)
        begin
          if(en == 1)
    //        $display("%b",Flit);
          M[addr][191:128] = Flit;
          seq = seq + 1;
        end
        else if(seq == 2'b10)
        begin
          if(en == 1)
     //      $display("%b",Flit);
          M[addr][127:64] = Flit;
          seq = seq + 1;
        end
        else if(seq == 2'b11)
        begin
          if(en == 1)
       //     $display("%b",Flit);
          M[addr][63:0] = Flit;
          seq = seq + 1;
          addr = addr + 1;
          en = 0;
        end
      end
    end
    
  end
  
  
endmodule
  