module inthandle(
    clockgb, resetn,
    address, indata, outdata, load, store,
    interrupts,
    intreq, intaddress, intack, 
    dints
);

input clockgb;
input resetn;

input [15:0] address;
input [7:0] indata;
output [7:0] outdata;
input load;
input store;

input [4:0] interrupts;
output reg intreq;
output reg [15:0] intaddress;
input intack;

output [4:0] dints = intf;


reg [2:0] intnum;

reg [4:0] intf;
reg [4:0] inte;


always @(*) begin
    integer i;
    
    intreq = 1'b0;
    intnum = 1'b0;
    
    for (i=5-1; i >= 0; i=i-1) begin
        if (intf[i] && inte[i]) begin
            intreq = 1'b1;
            intnum = i[2:0];
        end
    end
    
    case (intnum)
    0: intaddress = 16'h40;
    1: intaddress = 16'h48;
    2: intaddress = 16'h50;
    3: intaddress = 16'h58;
    4: intaddress = 16'h60;
    default: intaddress = 16'h00;
    endcase
end

always @(posedge clockgb or negedge resetn) begin
    integer i;
    
    if (!resetn) begin
        intf <= 0;
        inte <= 0;
    end else begin
        for (i=0; i < 5; i=i+1) begin
            if (interrupts[i]) begin
                intf[i] <= 1'b1;
            end else if (intreq && intack && i == intnum) begin
                intf[i] <= 1'b0;
            end
        end
    
        if (intf_store) begin
            intf <= intf_indata;
        end
        if (inte_store) begin
            inte <= inte_indata;
        end
    end
end


wire [4:0] intf_indata;
wire [7:0] intf_data;
wire intf_store;

rrmmap #(16'hff0f) intf_mmap(
    clockgb, resetn,
    address, indata, intf_data, load, store,,
    intf_indata, intf,, intf_store
);

wire [4:0] inte_indata;
wire [7:0] inte_data;
wire inte_store;

rrmmap #(16'hffff) inte_mmap(
    clockgb, resetn,
    address, indata, inte_data, load, store,,
    inte_indata, inte,, inte_store
);

assign outdata = intf_data | inte_data;

endmodule
    