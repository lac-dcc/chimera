entity b13 is 
port(
	reset : in bit;
	eoc : in bit;  
	soc : out bit;
	load_dato,
	add_mpx2 : out bit;

	canale : out integer range 8 downto 0;
	mux_en : out bit; 

	clock : in bit;
	
	data_in	: in bit_vector( 7 downto 0 ); 
	dsr : in bit;
	error : out bit;
	data_out : out bit
);
end b13;

architecture BEHAV of b13 is

	constant GP001 :integer:=0;
	constant GP010 :integer:=1;
	constant GP011 :integer:=2;
	constant GP100 :integer:=3;
	constant GP100w :integer:=4;
	constant GP101 :integer:=5;
	constant GP110 :integer:=6;
	constant GP111 :integer:=7;

	constant GP01 :integer:=0;
	constant GP10 :integer:=1;
	constant GP11 :integer:=2;
	constant GP11w :integer:=3;

	constant START_BIT :integer:=0;
	constant STOP_BIT :integer:=1;
	constant BIT0 :integer:=2;
	constant BIT1 :integer:=3;
	constant BIT2 :integer:=4;
	constant BIT3 :integer:=5;
	constant BIT4 :integer:=6;
	constant BIT5 :integer:=7;
	constant BIT6 :integer:=8;
	constant BIT7 :integer:=9;

	constant G_IDLE :integer:=0;
	constant G_LOAD :integer:=1;
	constant G_SEND :integer:=2;
	constant G_WAIT_END :integer:=3;

	signal S1 : integer range 7 downto 0;
	signal S2 : integer range 3 downto 0;

	signal mpx,
	       rdy, 
               send_data : bit;

	signal confirm : bit;
	signal shot : bit;

	signal	send_en : bit;
	signal	tre : bit;
	signal	out_reg : bit_vector( 7 downto 0 );
	signal	next_bit : integer range 9 downto 0;
	signal	tx_end : bit;
	signal	itfc_state : integer range 3 downto 0;
	signal	send, load : bit;

	signal	tx_conta : integer range 512 downto 0;

begin

process( reset, clock )
	variable	conta_tmp : integer range 8 downto 0;
begin
	if reset = '1' then
		S1 <= GP001;
		soc <= '0';
		canale <= 0;
		conta_tmp := 0;
		send_data <= '0';
		load_dato <= '0';
		mux_en <= '0';
	elsif clock'event and clock = '1' then
		case S1 is
			when GP001 =>
				mux_en <= '1';
				S1 <= GP010;
			when GP010 =>
				S1 <= GP011;
			when GP011 =>
				soc <= '1';	
				S1 <= GP101;
			when GP101 =>
				if eoc = '1' then
					S1 <= GP101;
				else
					load_dato <= '1';
					S1 <= GP110;
					mux_en <= '0';
				end if;
			when GP110 =>
				load_dato <= '0';
				soc <= '0';			
				conta_tmp := conta_tmp+1;
				if conta_tmp = 8 then
					conta_tmp := 0;
				end if;
				canale <= conta_tmp;
				S1 <= GP111;
			when GP111 =>
				send_data <= '1';
				S1 <= GP100w;
			when GP100w =>
				S1 <= GP100;
			when GP100 =>
				if rdy = '0' then
					S1 <= GP100;
				else
					S1 <= GP001;
					send_data <= '0';
				end if;
			when others =>
		end case;
	end if;
end process;

process (reset, clock )
begin
	if  reset = '1'  then
		S2 <= GP01;
		rdy <= '0';
		add_mpx2 <='0';
		mpx <= '0';
		shot <= '0';
	elsif clock'event and clock = '1' then
		case S2 is
			when GP01 =>  
				if send_data = '1' then
					rdy <= '1';
					S2 <= GP10;
				else
					S2 <= GP01;
				end if;
			when GP10 => 
				shot <= '1';
				S2 <= GP11;
			when GP11 => 
				if confirm = '0' then
					shot <= '0';
					S2 <= GP11;
				else 
					if mpx = '0' then
						add_mpx2 <= '1';
						mpx <= '1';
						S2 <= GP10;
					else
						mpx <= '0';
						rdy <= '0';
						S2 <= GP11w;
					end if;
				end if;
			when GP11w =>
				S2 <= GP01;
			when others => 
		end case;
	end if;
end process;


process( clock, reset )
begin
	if reset = '1' then
		load <= '0'; 
		send <= '0';
		confirm <= '0';
		itfc_state <= G_IDLE;
	elsif clock'event and clock = '1' then
		case itfc_state is
			when G_IDLE =>
				if shot = '1' then
					load <= '1';
					confirm <= '0';
					itfc_state <= G_LOAD;
				else
					confirm <= '0';
					itfc_state <= G_IDLE;
				end if;
			when G_LOAD =>
				load <= '0';
				send <= '1';
				itfc_state <= G_SEND;
			when G_SEND =>
				send <= '0';
				itfc_state <= G_WAIT_END;
			when G_WAIT_END =>
				if tx_end = '1' then
					confirm <= '1';
					itfc_state <= G_IDLE;
				end if;
			when others =>
		end case;
	end if;
end process;
					
process( clock, reset )
begin
	if reset ='1' then
		send_en <= '0';
		out_reg <= "00000000";
		tre <= '0';
		error <= '0';
	elsif clock'event and clock = '1' then
		if tx_end = '1' then
			send_en <= '0';
			tre <= '1';
		end if;

		if load = '1' then
			if tre = '0' then
				out_reg <= data_in;
				tre <= '1';
				error <= '0';
			else
				error <= '1';
			end if;
		end if;

		if send = '1' then
			if tre = '0' or dsr = '0' then 
				error <= '1';
			else
				error <= '0';		
				send_en <= '1';
			end if;
		end if;
	end if;
end process;
	
process( clock, reset )
	constant DelayTime : integer := 104;
begin
	if reset = '1' then
		tx_end <= '0';
		data_out <= '0';
		next_bit <= START_BIT;

		tx_conta <= 0;
	elsif clock'event and clock = '1' then
		tx_end <= '0';
		data_out <= '1';
		if send_en = '1' then		
			if tx_conta > DelayTime then
				case next_bit is
					when START_BIT =>
						data_out <= '0';
						next_bit <= BIT0;
					when BIT0 =>
						data_out <= out_reg( 7 );
						next_bit <= BIT1;	
					when BIT1 =>
						data_out <= out_reg( 6 );
						next_bit <= BIT2;	
					when BIT2 =>
						data_out <= out_reg( 5 );
						next_bit <= BIT3;	
					when BIT3 =>
						data_out <= out_reg( 4 );
						next_bit <= BIT4;	
					when BIT4 =>
						data_out <= out_reg( 3 );
						next_bit <= BIT5;	
					when BIT5 =>
						data_out <= out_reg( 2 );
						next_bit <= BIT6;	
					when BIT6 =>
						data_out <= out_reg( 1 );
						next_bit <= BIT7;	
					when BIT7 =>
						data_out <= out_reg( 0 );
						next_bit <= STOP_BIT;	
					when STOP_BIT =>
						data_out <= '1';
						next_bit <= START_BIT;
						tx_end <= '1';
				end case;
				tx_conta <= 0;
			else
				tx_conta <= tx_conta+1;
			end if;
		end if;
	end if;
end process;
end BEHAV;
