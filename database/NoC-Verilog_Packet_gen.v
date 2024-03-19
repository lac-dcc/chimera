module Packet_gen (input end_sim, input clk, reset, input j_e, input [2:0] src_X, src_Y, output reg [63:0] Flit, output reg write_req, input write_req_ack);
  
  reg [4:0] count;
  reg [31:0] t1, t2;
  reg [63:0] temp;
  reg [49:0] Flit_ID;
  
  reg [43:0] cnt;
  
  reg [5:0] ID;
  
  
  
  reg [2:0] dest_Y, dest_X;
  
  reg [2:0] State;
  reg [2:0] Next_State;
  
  
  always @(posedge clk)
  begin
    case (State)
      3'b000:
      begin
       count = 0;
       cnt = 0;
      end
      3'b001:
      begin
        count = count + 1;
        cnt = cnt;
      end
      3'b010:
      begin
       count = count;
       cnt = cnt;
      end
      3'b011:
      begin
        count = count;
        cnt = cnt + 1;
      end
      3'b100:
      begin
        count = count;
        cnt = cnt;
      end
      3'b101:
      begin
        count = count;
        cnt = cnt;
      end
      3'b110:
      begin
        count = 0;
        cnt = cnt;
      end
      3'b111:
      begin
        count = 0;
        cnt = cnt;
      end      
    endcase
  end
  

  
  always @(posedge clk)
  begin
    if(reset == 1)
      State <= 3'b0;
    else
      State <= Next_State;
  end
  
  always @(*)
  begin
    case (State)
      3'b000:
          Next_State = 3'b001;
      3'b001:
      begin
        if(count == 5'b01001)
          Next_State = 3'b010;
        else
          Next_State = 3'b001;
      end
      3'b010:
      begin
        if(j_e == 0)
          Next_State = 3'b010;
        else if(j_e == 1)
          Next_State = 3'b011;
      end
      3'b011: Next_State = 3'b100;
      3'b100: Next_State = 3'b101;
      3'b101: Next_State = 3'b110;
      3'b110: Next_State = 3'b111;
      3'b111: Next_State = 3'b001;
    endcase
  end
  
  always @(*)
  begin
    case (State)
      3'b000:
      begin
        write_req = 0;
      end
      3'b001:
        write_req = 0;
      3'b010:
        write_req = 0;
      3'b011: 
      begin
		dest_X = src_X;
        dest_Y = src_Y;
        while(dest_X == src_X && dest_Y == src_Y)
        begin
          {dest_X, dest_Y} = $random();
        end
        write_req = 1;
        Flit_ID = {cnt, ID};
        t1 = $random();
        t2 = $random();
        temp = {t1, t2};
        temp[63:62] = 2'b11;
        temp[11:0] = {dest_Y, dest_X, src_Y, src_X};
        temp[61:12] = Flit_ID;
        Flit = temp;
      end
      3'b100:
      begin
        write_req = 1;
        t1 = $random();
        t2 = $random();
        temp = {t1, t2};
        temp[63:62] = 2'b01;
        temp[11:0] = {dest_Y, dest_X, src_Y, src_X};
        Flit = temp;
      end
      3'b101:
      begin
        write_req = 1;
        t1 = $random();
        t2 = $random();
        temp = {t1, t2};
        temp[63:62] = 2'b01;
        temp[11:0] = {dest_Y, dest_X, src_Y, src_X};
        Flit = temp;
      end
      3'b110:
      begin
        write_req = 1;
        t1 = $random();
        t2 = $random();
        temp = {t1, t2};
        temp[63:62] = 2'b10;
        temp[11:0] = {dest_Y, dest_X, src_Y, src_X};
        Flit = temp;
      end
      3'b111:
      begin
        write_req = 0;
      end
    endcase
  end
  
  always @(*)
  begin
    ID = src_Y * 8 + src_X;
  end
  
  
  endmodule
  