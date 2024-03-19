module uart_to_ps2 (
  input clk_25mhz,
  output reg ps2_data,
  output reg ps2_clk,
  input [6:0] btn,
  output reg [7:0] led,
  input ftdi_txd,
  output usb_fpga_pu_dp,
  output usb_fpga_pu_dn
);

assign usb_fpga_pu_dp = 1;
assign usb_fpga_pu_dn = 1;

wire PB1_state, PB1_down, PB1_up;
wire PB2_state, PB2_down, PB2_up;
wire busy;

PushButton_Debouncer pdb1 (
  .clk(clk_25mhz),.PB(btn[1]), .PB_state(PB1_state),
  .PB_down(PB1_down), .PB_up(PB1_up)
);

PushButton_Debouncer pdb2 (
  .clk(clk_25mhz),.PB(btn[2]), .PB_state(PB2_state),
  .PB_down(PB2_down), .PB_up(PB2_up)
);

reg [7:0] data;
reg extended = 0;
reg shift = 0;
reg [1:0] escape = 0;

always @(posedge clk_25mhz) begin
  if (PB1_up) begin data <= 8'h6b; extended <= 1; end
  else if (PB2_up) begin data <= 8'h74; extended <= 1; end

  if (RxD_data_ready) begin
    if (escape1 && escape == 0) escape <= 1;
    else if (escape2 && escape == 1) escape <= 2;
    else escape <= 0;

    led <= RxD_data;

    extended <= 0;
    shift <= 0;

    case (RxD_data) 
      "a": data <= 8'h1c;
      "b": data <= 8'h32;
      "c": data <= 8'h21;
      "d": data <= 8'h23;
      "e": data <= 8'h24;
      "f": data <= 8'h2b;
      "g": data <= 8'h34;
      "h": data <= 8'h33;
      "i": data <= 8'h43;
      "j": data <= 8'h3b;
      "k": data <= 8'h42;
      "l": data <= 8'h4b;
      "m": data <= 8'h3a;
      "n": data <= 8'h31;
      "o": data <= 8'h44;
      "p": data <= 8'h4d;
      "q": data <= 8'h15;
      "r": data <= 8'h2d;
      "s": data <= 8'h1b;
      "t": data <= 8'h2c;
      "u": data <= 8'h3c;
      "v": data <= 8'h2a;
      "w": data <= 8'h1d;
      "x": data <= 8'h22;
      "y": data <= 8'h35;
      "z": data <= 8'h1a;
      "A": if (escape == 2) begin data <= 8'h75; extended <= 1; end // up arrow
           else begin data <= 8'h1c; shift <= 1; end
      "B": if (escape == 2) begin data <= 8'h72; extended <= 1; end // down arrow
           else  begin data <= 8'h32; shift <= 1; end
      "C": if (escape == 2) begin data <= 8'h74; extended <= 1; end // right arrow
           else begin data <= 8'h21; shift <= 1; end
      "D": if (escape == 2) begin data <= 8'h6b; extended <= 1; end // left arrow
           else begin data <= 8'h23; shift <= 1; end
      "E": begin data <= 8'h24; shift <= 1; end
      "F": begin data <= 8'h2b; shift <= 1; end
      "G": begin data <= 8'h34; shift <= 1; end
      "H": begin data <= 8'h33; shift <= 1; end
      "I": begin data <= 8'h43; shift <= 1; end
      "J": begin data <= 8'h3b; shift <= 1; end
      "K": begin data <= 8'h42; shift <= 1; end
      "L": begin data <= 8'h4b; shift <= 1; end
      "M": begin data <= 8'h3a; shift <= 1; end
      "N": begin data <= 8'h31; shift <= 1; end
      "O": begin data <= 8'h44; shift <= 1; end
      "P": begin data <= 8'h4d; shift <= 1; end
      "Q": begin data <= 8'h15; shift <= 1; end
      "R": begin data <= 8'h2d; shift <= 1; end
      "S": begin data <= 8'h1b; shift <= 1; end
      "T": begin data <= 8'h2c; shift <= 1; end
      "U": begin data <= 8'h3c; shift <= 1; end
      "V": begin data <= 8'h2a; shift <= 1; end
      "W": begin data <= 8'h1d; shift <= 1; end
      "X": begin data <= 8'h22; shift <= 1; end
      "Y": begin data <= 8'h35; shift <= 1; end
      "Z": begin data <= 8'h1a; shift <= 1; end
      "0": data <= 8'h45;
      "1": data <= 8'h16;
      "2": data <= 8'h1e;
      "3": data <= 8'h26;
      "4": data <= 8'h25;
      "5": data <= 8'h2e;
      "6": data <= 8'h36;
      "7": data <= 8'h3d;
      "8": data <= 8'h3e;
      "9": data <= 8'h46;
      ")": begin data <= 8'h45; shift <= 1; end
      "!": begin data <= 8'h16; shift <= 1; end
      "@": begin data <= 8'h1e; shift <= 1; end
      "#": begin data <= 8'h26; shift <= 1; end
      "$": begin data <= 8'h25; shift <= 1; end
      "%": begin data <= 8'h2e; shift <= 1; end
      "^": begin data <= 8'h36; shift <= 1; end
      "&": begin data <= 8'h3d; shift <= 1; end
      "*": begin data <= 8'h3e; shift <= 1; end
      "(": begin data <= 8'h46; shift <= 1; end
      "`": data <= 8'h0e;
      "¬": begin data <= 8'h0e; shift <= 1; end
      "-": data <= 8'h4e;
      "_": begin data <= 8'h4e; shift <= 1; end
      "=": data <= 8'h55;
      "+": begin data <= 8'h55; shift <= 1; end
      "[": data <= 8'h54;
      "{": begin data <= 8'h54; shift <= 1; end
      "]": data <= 8'h5b;
      "}": begin data <= 8'h5b; shift <= 1; end
      ";": data <= 8'h4c;
      ":": begin data <= 8'h4c; shift <= 1; end
      "'": data <= 8'h52;
      "\"": begin data <= 8'h52; shift <= 1; end
      ",": data <= 8'h41;
      "<": begin data <= 8'h41; shift <= 1; end
      ".": data <= 8'h49;
      ">": begin data <= 8'h49; shift <= 1; end
      "/": data <= 8'h4a;
      "?": begin data <= 8'h4a; shift <= 1; end 
      "\\": data <= 8'h5d;
      "|": begin data <= 8'h5d; shift <= 1; end 
      " ": data <= 8'h29;
      8'h0d: data <= 8'h5A; // Enter
      8'h7f: data <= 8'h66; // Backspace
      8'h09: data <= 8'h0d; // Backspace
      8'h1b: data <= 8'h76; // Escape
    endcase
  end
end

wire [7:0] led1;
wire escape1 = RxD_data == 8'h1b;
wire escape2 = RxD_data == 8'h5b;

ps2_send send (
  .clk_25mhz(clk_25mhz),
  .ps2_clk(ps2_clk),
  .ps2_data(ps2_data),
  .req(PB1_up | PB2_up | (RxD_data_ready && !escape1 && !(escape2 && escape == 1))),
  .busy(busy),
  .data(data),
  .extended(extended),
  .shift(shift),
  .led(led1)
);

wire RxD_data_ready;
wire [7:0] RxD_data;

async_receiver deserializer(
  .clk(clk_25mhz),
  .RxD(ftdi_txd), 
  .RxD_data_ready(RxD_data_ready), 
  .RxD_data(RxD_data)
);

endmodule

