`include "_parameter.v"

module ModExp_tb();
	reg clk;
	reg reset;
	reg [`DATA_WIDTH - 1 : 0] m_buf;
	reg [`DATA_WIDTH - 1 : 0] e_buf;
	reg [`DATA_WIDTH - 1 : 0] n_buf;
	reg startInput;
	reg startCompute;
	reg getResult;
	wire [`DATA_WIDTH - 1 : 0] res_out;
	wire [4 : 0] exp_state;
	wire [3 : 0] state;
	
	ModExp modexp0(
		.clk(clk), .reset(reset), .m_buf(m_buf), .e_buf(e_buf),
		.startInput(startInput), .startCompute(startCompute), .getResult(getResult), 
		.exp_state(exp_state), .state(state), .res_out(res_out)
	);
	
	initial begin
		clk = 0;
		reset = 0;
		startInput = 0;
		startCompute = 0;
		getResult = 0;
		m_buf = 64'h0000000000000000;
		e_buf = 64'h0000000000000000;
		#100 startInput = 1;	

#10
m_buf = 64'h95d1805142cb6d1d;
e_buf = 64'h0000000000000005;
n_buf = 64'h1622bd795fec898f;
#10
m_buf = 64'h2aa50f4ec6f00933;
e_buf = 64'h0000000000000000;
n_buf = 64'ha9ec0806705fca16;
#10
m_buf = 64'h31234efe6e648043;
e_buf = 64'h0000000000000000;
n_buf = 64'h1ba1621582283d15;
#10
m_buf = 64'h1d7173e55bc7fdeb;
e_buf = 64'h0000000000000000;
n_buf = 64'h29e821a4c74803e3;
#10
m_buf = 64'hd26d53961058fe8c;
e_buf = 64'h0000000000000000;
n_buf = 64'hd707107e855c3844;
#10
m_buf = 64'hda54f267dd138266;
e_buf = 64'h0000000000000000;
n_buf = 64'h5eda92d864ac5db9;
#10
m_buf = 64'h07120911b3b68b57;
e_buf = 64'h0000000000000000;
n_buf = 64'hbb968a437d5c8dfc;
#10
m_buf = 64'h869bdbd2e72bb5b7;
e_buf = 64'h0000000000000000;
n_buf = 64'h78255d6807923986;
#10
m_buf = 64'hc09fcd8f739cd488;
e_buf = 64'h0000000000000000;
n_buf = 64'h4efbc8d60b21fbac;
#10
m_buf = 64'h33a1d1c2ad4ab155;
e_buf = 64'h0000000000000000;
n_buf = 64'hd92a4aa2b410d93c;
#10
m_buf = 64'h7f411fed1e70e799;
e_buf = 64'h0000000000000000;
n_buf = 64'h9d643c25fbb230bb;
#10
m_buf = 64'h41a8a6e165e04993;
e_buf = 64'h0000000000000000;
n_buf = 64'h9403560d97dae38d;
#10
m_buf = 64'ha41865bf350d278d;
e_buf = 64'h0000000000000000;
n_buf = 64'ha5ac06d864c2f2e3;
#10
m_buf = 64'hff3e0ba10ac728b4;
e_buf = 64'h0000000000000000;
n_buf = 64'h2b28fef02b9c014e;
#10
m_buf = 64'hcc249558f2ad985f;
e_buf = 64'h0000000000000000;
n_buf = 64'h3a1890c78092b4d4;
#10
m_buf = 64'h9f9821883744da64;
e_buf = 64'h0000000000000000;
n_buf = 64'h0326324dfb695ffb;
#10
m_buf = 64'h1ac902ee25777cf0;
e_buf = 64'h0000000000000000;
n_buf = 64'h33138131c541013d;
#10
m_buf = 64'h755a3ac132ae2a20;
e_buf = 64'h0000000000000000;
n_buf = 64'heb8ac8ce8a245e6b;
#10
m_buf = 64'h5c94938160c6b3ed;
e_buf = 64'h0000000000000000;
n_buf = 64'h8c5fe8f8dc3bf364;
#10
m_buf = 64'hd3b564b08be04c3e;
e_buf = 64'h0000000000000000;
n_buf = 64'h678a5aa33b6fe507;
#10
m_buf = 64'h1ad0a6f226bdd974;
e_buf = 64'h0000000000000000;
n_buf = 64'h5804f92283868a29;
#10
m_buf = 64'h98a33736fd1ac7ce;
e_buf = 64'h0000000000000000;
n_buf = 64'hd8f33418f3d4e711;
#10
m_buf = 64'h7ce71b48fba52e59;
e_buf = 64'h0000000000000000;
n_buf = 64'h5a702cfa93ea5c4e;
#10
m_buf = 64'h905c053b25fdacbe;
e_buf = 64'h0000000000000000;
n_buf = 64'he8e5b4617589a82b;
#10
m_buf = 64'ha36bcb0167e98363;
e_buf = 64'h0000000000000000;
n_buf = 64'ha8c24d4244ef7feb;
#10
m_buf = 64'h6c596216ae0fdbc8;
e_buf = 64'h0000000000000000;
n_buf = 64'h9be3cecb8c497c68;
#10
m_buf = 64'h856f3d95e0ae1a1b;
e_buf = 64'h0000000000000000;
n_buf = 64'hbab9f87ff5059285;
#10
m_buf = 64'hade7cef37ed2ec2f;
e_buf = 64'h0000000000000000;
n_buf = 64'h62397bc701762741;
#10
m_buf = 64'he345ac72eac39204;
e_buf = 64'h0000000000000000;
n_buf = 64'hdb610487c89da11b;
#10
m_buf = 64'hd5627386528cc241;
e_buf = 64'h0000000000000000;
n_buf = 64'hf463b337d20b5d59;
#10
m_buf = 64'hff88ec827f99d273;
e_buf = 64'h0000000000000000;
n_buf = 64'hf03edca7e2dcaa37;
#10
m_buf = 64'ha2939b3b7fa74d8a;
e_buf = 64'h0000000000000000;
n_buf = 64'h83333218bd91a1b7;
#10
m_buf = 64'hdfec4623ab899605;
e_buf = 64'h0000000000000000;
n_buf = 64'h21167d8fcf23cae8;
#10
m_buf = 64'h8af5890333b5b3ce;
e_buf = 64'h0000000000000000;
n_buf = 64'hc703806984c81999;
#10
m_buf = 64'hee6a8e2f9c19ed34;
e_buf = 64'h0000000000000000;
n_buf = 64'h349aae908fb5262c;
#10
m_buf = 64'h027c013f38018399;
e_buf = 64'h0000000000000000;
n_buf = 64'hf320cd576d14475b;
#10
m_buf = 64'hb4a1ca795718ada2;
e_buf = 64'h0000000000000000;
n_buf = 64'h7b297d0b0e5e18ba;
#10
m_buf = 64'hbf3df0bbf66ac168;
e_buf = 64'h0000000000000000;
n_buf = 64'h5d5f576cdeb8fc4c;
#10
m_buf = 64'h51797350e6256403;
e_buf = 64'h0000000000000000;
n_buf = 64'h8ded3c9691eb79fa;
#10
m_buf = 64'h52631db9d17034ce;
e_buf = 64'h0000000000000000;
n_buf = 64'hf0e642f43328ad08;
#10
m_buf = 64'h866d7002091472ad;
e_buf = 64'h0000000000000000;
n_buf = 64'h69d495dd81355c53;
#10
m_buf = 64'hdfde228125fb5f3d;
e_buf = 64'h0000000000000000;
n_buf = 64'hd037cdff7c240d49;
#10
m_buf = 64'h9a431f7a41c30359;
e_buf = 64'h0000000000000000;
n_buf = 64'h6a17b9af5b569643;
#10
m_buf = 64'h27e969e2c8bf23fb;
e_buf = 64'h0000000000000000;
n_buf = 64'h0067dba858989008;
#10
m_buf = 64'h61067a8cd7a3283c;
e_buf = 64'h0000000000000000;
n_buf = 64'h8a449ebe89d9bf02;
#10
m_buf = 64'h4b5ca436953c178e;
e_buf = 64'h0000000000000000;
n_buf = 64'hc9546b439f9d0129;
#10
m_buf = 64'hb4d4dfccb7d779cc;
e_buf = 64'h0000000000000000;
n_buf = 64'h54c56c9a9cc9af4e;
#10
m_buf = 64'h786e30efce9b2e70;
e_buf = 64'h0000000000000000;
n_buf = 64'h99901c0475491bc3;
#10
m_buf = 64'hccc93ff710fce97d;
e_buf = 64'h0000000000000000;
n_buf = 64'hcdf8440407295e42;
#10
m_buf = 64'h843b2a7d15ab2c21;
e_buf = 64'h0000000000000000;
n_buf = 64'ha2a7ae1f3ac7652c;
#10
m_buf = 64'hea5f24b6de6fec4b;
e_buf = 64'h0000000000000000;
n_buf = 64'h8cfe5cd12d5db79b;
#10
m_buf = 64'h10fc9eee0a1727f7;
e_buf = 64'h0000000000000000;
n_buf = 64'h2e47dc0e959f3a51;
#10
m_buf = 64'h21681081399f8a8f;
e_buf = 64'h0000000000000000;
n_buf = 64'h1773308cdc6b13ab;
#10
m_buf = 64'h4cea2df00a66dc4e;
e_buf = 64'h0000000000000000;
n_buf = 64'h8d103ed3cc667e97;
#10
m_buf = 64'hc2472fd603e9ba02;
e_buf = 64'h0000000000000000;
n_buf = 64'hd9ed17e3cc0e95ee;
#10
m_buf = 64'h72d6bc20d80d6a1c;
e_buf = 64'h0000000000000000;
n_buf = 64'hee52bdb6d1020a15;
#10
m_buf = 64'hdca5b35354a1d505;
e_buf = 64'h0000000000000000;
n_buf = 64'h084f3dd6415af341;
#10
m_buf = 64'hccf719ab2922fbd8;
e_buf = 64'h0000000000000000;
n_buf = 64'hf18dd1eed77c96c0;
#10
m_buf = 64'hde62d43f261908b9;
e_buf = 64'h0000000000000000;
n_buf = 64'h12093d26ac512b01;
#10
m_buf = 64'h75f2bc20a7f5195c;
e_buf = 64'h0000000000000000;
n_buf = 64'hde3a5db5154ed512;
#10
m_buf = 64'h5f0ef320f7f60e7f;
e_buf = 64'h0000000000000000;
n_buf = 64'h73f7ba8e0445d656;
#10
m_buf = 64'h61d9fe398147a8f4;
e_buf = 64'h0000000000000000;
n_buf = 64'hc10faa4003ba33db;
#10
m_buf = 64'h87a1798fe6addd9e;
e_buf = 64'h0000000000000000;
n_buf = 64'h47fc816ac16e2284;
#10
m_buf = 64'h044d9850809f2923;
e_buf = 64'h0000000000000000;
n_buf = 64'h84c5b4763fe31d03;

		startCompute = 1;
	
	#1000
	getResult = 1;
	#100
	startCompute = 1;


#10000000
reset = 1;
startInput = 0;
#100
reset = 0;
#100 
startInput = 1;	

#10
m_buf = 64'h95d1805142cb6d1d;
e_buf = 64'h000000000000000f;
n_buf = 64'h1622bd795fec898f;
#10
m_buf = 64'h2aa50f4ec6f00933;
e_buf = 64'h0000000000000000;
n_buf = 64'ha9ec0806705fca16;
#10
m_buf = 64'h31234efe6e648043;
e_buf = 64'h0000000000000000;
n_buf = 64'h1ba1621582283d15;
#10
m_buf = 64'h1d7173e55bc7fdeb;
e_buf = 64'h0000000000000000;
n_buf = 64'h29e821a4c74803e3;
#10
m_buf = 64'hd26d53961058fe8c;
e_buf = 64'h0000000000000000;
n_buf = 64'hd707107e855c3844;
#10
m_buf = 64'hda54f267dd138266;
e_buf = 64'h0000000000000000;
n_buf = 64'h5eda92d864ac5db9;
#10
m_buf = 64'h07120911b3b68b57;
e_buf = 64'h0000000000000000;
n_buf = 64'hbb968a437d5c8dfc;
#10
m_buf = 64'h869bdbd2e72bb5b7;
e_buf = 64'h0000000000000000;
n_buf = 64'h78255d6807923986;
#10
m_buf = 64'hc09fcd8f739cd488;
e_buf = 64'h0000000000000000;
n_buf = 64'h4efbc8d60b21fbac;
#10
m_buf = 64'h33a1d1c2ad4ab155;
e_buf = 64'h0000000000000000;
n_buf = 64'hd92a4aa2b410d93c;
#10
m_buf = 64'h7f411fed1e70e799;
e_buf = 64'h0000000000000000;
n_buf = 64'h9d643c25fbb230bb;
#10
m_buf = 64'h41a8a6e165e04993;
e_buf = 64'h0000000000000000;
n_buf = 64'h9403560d97dae38d;
#10
m_buf = 64'ha41865bf350d278d;
e_buf = 64'h0000000000000000;
n_buf = 64'ha5ac06d864c2f2e3;
#10
m_buf = 64'hff3e0ba10ac728b4;
e_buf = 64'h0000000000000000;
n_buf = 64'h2b28fef02b9c014e;
#10
m_buf = 64'hcc249558f2ad985f;
e_buf = 64'h0000000000000000;
n_buf = 64'h3a1890c78092b4d4;
#10
m_buf = 64'h9f9821883744da64;
e_buf = 64'h0000000000000000;
n_buf = 64'h0326324dfb695ffb;
#10
m_buf = 64'h1ac902ee25777cf0;
e_buf = 64'h0000000000000000;
n_buf = 64'h33138131c541013d;
#10
m_buf = 64'h755a3ac132ae2a20;
e_buf = 64'h0000000000000000;
n_buf = 64'heb8ac8ce8a245e6b;
#10
m_buf = 64'h5c94938160c6b3ed;
e_buf = 64'h0000000000000000;
n_buf = 64'h8c5fe8f8dc3bf364;
#10
m_buf = 64'hd3b564b08be04c3e;
e_buf = 64'h0000000000000000;
n_buf = 64'h678a5aa33b6fe507;
#10
m_buf = 64'h1ad0a6f226bdd974;
e_buf = 64'h0000000000000000;
n_buf = 64'h5804f92283868a29;
#10
m_buf = 64'h98a33736fd1ac7ce;
e_buf = 64'h0000000000000000;
n_buf = 64'hd8f33418f3d4e711;
#10
m_buf = 64'h7ce71b48fba52e59;
e_buf = 64'h0000000000000000;
n_buf = 64'h5a702cfa93ea5c4e;
#10
m_buf = 64'h905c053b25fdacbe;
e_buf = 64'h0000000000000000;
n_buf = 64'he8e5b4617589a82b;
#10
m_buf = 64'ha36bcb0167e98363;
e_buf = 64'h0000000000000000;
n_buf = 64'ha8c24d4244ef7feb;
#10
m_buf = 64'h6c596216ae0fdbc8;
e_buf = 64'h0000000000000000;
n_buf = 64'h9be3cecb8c497c68;
#10
m_buf = 64'h856f3d95e0ae1a1b;
e_buf = 64'h0000000000000000;
n_buf = 64'hbab9f87ff5059285;
#10
m_buf = 64'hade7cef37ed2ec2f;
e_buf = 64'h0000000000000000;
n_buf = 64'h62397bc701762741;
#10
m_buf = 64'he345ac72eac39204;
e_buf = 64'h0000000000000000;
n_buf = 64'hdb610487c89da11b;
#10
m_buf = 64'hd5627386528cc241;
e_buf = 64'h0000000000000000;
n_buf = 64'hf463b337d20b5d59;
#10
m_buf = 64'hff88ec827f99d273;
e_buf = 64'h0000000000000000;
n_buf = 64'hf03edca7e2dcaa37;
#10
m_buf = 64'ha2939b3b7fa74d8a;
e_buf = 64'h0000000000000000;
n_buf = 64'h83333218bd91a1b7;
#10
m_buf = 64'hdfec4623ab899605;
e_buf = 64'h0000000000000000;
n_buf = 64'h21167d8fcf23cae8;
#10
m_buf = 64'h8af5890333b5b3ce;
e_buf = 64'h0000000000000000;
n_buf = 64'hc703806984c81999;
#10
m_buf = 64'hee6a8e2f9c19ed34;
e_buf = 64'h0000000000000000;
n_buf = 64'h349aae908fb5262c;
#10
m_buf = 64'h027c013f38018399;
e_buf = 64'h0000000000000000;
n_buf = 64'hf320cd576d14475b;
#10
m_buf = 64'hb4a1ca795718ada2;
e_buf = 64'h0000000000000000;
n_buf = 64'h7b297d0b0e5e18ba;
#10
m_buf = 64'hbf3df0bbf66ac168;
e_buf = 64'h0000000000000000;
n_buf = 64'h5d5f576cdeb8fc4c;
#10
m_buf = 64'h51797350e6256403;
e_buf = 64'h0000000000000000;
n_buf = 64'h8ded3c9691eb79fa;
#10
m_buf = 64'h52631db9d17034ce;
e_buf = 64'h0000000000000000;
n_buf = 64'hf0e642f43328ad08;
#10
m_buf = 64'h866d7002091472ad;
e_buf = 64'h0000000000000000;
n_buf = 64'h69d495dd81355c53;
#10
m_buf = 64'hdfde228125fb5f3d;
e_buf = 64'h0000000000000000;
n_buf = 64'hd037cdff7c240d49;
#10
m_buf = 64'h9a431f7a41c30359;
e_buf = 64'h0000000000000000;
n_buf = 64'h6a17b9af5b569643;
#10
m_buf = 64'h27e969e2c8bf23fb;
e_buf = 64'h0000000000000000;
n_buf = 64'h0067dba858989008;
#10
m_buf = 64'h61067a8cd7a3283c;
e_buf = 64'h0000000000000000;
n_buf = 64'h8a449ebe89d9bf02;
#10
m_buf = 64'h4b5ca436953c178e;
e_buf = 64'h0000000000000000;
n_buf = 64'hc9546b439f9d0129;
#10
m_buf = 64'hb4d4dfccb7d779cc;
e_buf = 64'h0000000000000000;
n_buf = 64'h54c56c9a9cc9af4e;
#10
m_buf = 64'h786e30efce9b2e70;
e_buf = 64'h0000000000000000;
n_buf = 64'h99901c0475491bc3;
#10
m_buf = 64'hccc93ff710fce97d;
e_buf = 64'h0000000000000000;
n_buf = 64'hcdf8440407295e42;
#10
m_buf = 64'h843b2a7d15ab2c21;
e_buf = 64'h0000000000000000;
n_buf = 64'ha2a7ae1f3ac7652c;
#10
m_buf = 64'hea5f24b6de6fec4b;
e_buf = 64'h0000000000000000;
n_buf = 64'h8cfe5cd12d5db79b;
#10
m_buf = 64'h10fc9eee0a1727f7;
e_buf = 64'h0000000000000000;
n_buf = 64'h2e47dc0e959f3a51;
#10
m_buf = 64'h21681081399f8a8f;
e_buf = 64'h0000000000000000;
n_buf = 64'h1773308cdc6b13ab;
#10
m_buf = 64'h4cea2df00a66dc4e;
e_buf = 64'h0000000000000000;
n_buf = 64'h8d103ed3cc667e97;
#10
m_buf = 64'hc2472fd603e9ba02;
e_buf = 64'h0000000000000000;
n_buf = 64'hd9ed17e3cc0e95ee;
#10
m_buf = 64'h72d6bc20d80d6a1c;
e_buf = 64'h0000000000000000;
n_buf = 64'hee52bdb6d1020a15;
#10
m_buf = 64'hdca5b35354a1d505;
e_buf = 64'h0000000000000000;
n_buf = 64'h084f3dd6415af341;
#10
m_buf = 64'hccf719ab2922fbd8;
e_buf = 64'h0000000000000000;
n_buf = 64'hf18dd1eed77c96c0;
#10
m_buf = 64'hde62d43f261908b9;
e_buf = 64'h0000000000000000;
n_buf = 64'h12093d26ac512b01;
#10
m_buf = 64'h75f2bc20a7f5195c;
e_buf = 64'h0000000000000000;
n_buf = 64'hde3a5db5154ed512;
#10
m_buf = 64'h5f0ef320f7f60e7f;
e_buf = 64'h0000000000000000;
n_buf = 64'h73f7ba8e0445d656;
#10
m_buf = 64'h61d9fe398147a8f4;
e_buf = 64'h0000000000000000;
n_buf = 64'hc10faa4003ba33db;
#10
m_buf = 64'h87a1798fe6addd9e;
e_buf = 64'h0000000000000000;
n_buf = 64'h47fc816ac16e2284;
#10
m_buf = 64'h044d9850809f2923;
e_buf = 64'h0000000000000000;
n_buf = 64'h84c5b4763fe31d03;

	#10000000	
	startCompute = 0;
	getResult = 1;

	end
	
	always begin
		#5 clk = ~clk;
	end
	
endmodule
