LIBRARY ieee;
USE ieee.std_logic_1164.all;
package ann_types is
	type ann_mode is ( idle, run, learn );
end package ann_types;

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.float_types.all;
USE work.sram_types.all;
USE work.ann_types.all;

PACKAGE ann_components IS
	
	COMPONENT ann IS
		GENERIC (
			N_I : INTEGER := 2;	-- number of perceptrons at input layer
			N_H	: INTEGER := 3;	-- number of perceptrons at hidden layer
			N_O : INTEGER := 1	-- number of perceptrons at output layer
		);
		PORT (
			reset, clock : IN STD_LOGIC;
			mode : IN ann_mode;
			alpha : IN float;
			inputs : IN float_vector(N_I-1 downto 0);
			targets : IN float_vector(N_O-1 downto 0);
			outputs : OUT float_vector(N_O-1 downto 0);
			mse : OUT float;
			ready : OUT STD_LOGIC;
			
			float_alu_a : OUT float;
			float_alu_b : OUT float;
			float_alu_c : IN float;
			float_alu_mode : INOUT float_alu_mode;
			float_alu_ready : IN STD_LOGIC;
			
			sram_addr : OUT sram_address;
			sram_input : OUT sram_data;
			sram_output : IN sram_data;
			sram_mode : INOUT sram_mode;
			sram_ready : IN STD_LOGIC;
			
			lfsr_output : IN STD_LOGIC_VECTOR(15 downto 0)
		);
	END COMPONENT ann;
END PACKAGE ann_components;



LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
USE work.float_types.all;
USE work.float_constants.all;
USE work.sram_types.all;
USE work.ann_types.all;

ENTITY ann IS
	GENERIC (
		N_I : INTEGER := 2;	-- number of perceptrons at input layer
		N_H	: INTEGER := 3;	-- number of perceptrons at hidden layer
		N_O : INTEGER := 1	-- number of perceptrons at output layer
	);
	PORT (
		reset, clock : IN STD_LOGIC;
		mode : IN ann_mode;
		alpha : IN float;
		inputs : IN float_vector(N_I-1 downto 0);
		targets : IN float_vector(N_O-1 downto 0);
		outputs : OUT float_vector(N_O-1 downto 0);
		mse : OUT float;
		ready : OUT STD_LOGIC;
		
		float_alu_a : OUT float;
		float_alu_b : OUT float;
		float_alu_c : IN float;
		float_alu_mode : INOUT float_alu_mode;
		float_alu_ready : IN STD_LOGIC;
		
		sram_addr : OUT sram_address;
		sram_input : OUT sram_data;
		sram_output : IN sram_data;
		sram_mode : INOUT sram_mode;
		sram_ready : IN STD_LOGIC;
		
		lfsr_output : IN STD_LOGIC_VECTOR(15 downto 0)
	);
END ENTITY ann;

ARCHITECTURE ann OF ann IS
	-- outputs for each peceptron
	SIGNAL hidden_outputs : float_vector(N_H - 1 downto 0) := (others => float_zero);
	SIGNAL output_outputs : float_vector(N_O - 1 downto 0) := (others => float_zero);
	
	-- deltas for back propagation
	SIGNAL hidden_deltas : float_vector(N_H - 1 downto 0) := (others => float_zero);
	SIGNAL output_deltas : float_vector(N_O - 1 downto 0) := (others => float_zero);

	-- state machine
	TYPE states IS (
		init,				
		init_weight,
		init_weight_complete,		
		run,						-- resets all outputs of hidden layer and output layer to 0
		hidden_weighted_bias_load,
		hidden_weighted_bias_load_complete,
		hidden_weighted_value_load,
		hidden_weighted_value_load_complete,
		hidden_weighted_value_mul,	-- calculate one weighted value for one hidden layer's perceptron
		hidden_weighted_value_mul_complete,
		hidden_weighted_value_add,	-- sum one weighted value for one hidden layer's perceptron
		hidden_weighted_value_add_complete,
		hidden_sig_neg,
		hidden_sig_exp,				-- calculate exponential for sigmoid function for one hidden layer's perceptron
		hidden_sig_exp_complete,
		hidden_sig_add,				-- calculate add 1 for sigmoid function for one hidden layer's perceptron
		hidden_sig_add_complete,
		hidden_sig_div,				-- calculate 1 over for sigmoid function for one hidden layer's perceptron
		hidden_sig_div_complete,
		output_weighted_bias_load,
		output_weighted_bias_load_complete,
		output_weighted_value_load,
		output_weighted_value_load_complete,
		output_weighted_value_mul,	-- calculate one weighted value for one output layer's perceptron
		output_weighted_value_mul_complete,
		output_weighted_value_add,	-- sum one weighted value for one output layer's perceptron
		output_weighted_value_add_complete,
		output_sig_neg,
		output_sig_exp,				-- calculate exponential for sigmoid function for one output layer's perceptron
		output_sig_exp_complete,
		output_sig_add,				-- calculate add 1 for sigmoid function for one output layer's perceptron
		output_sig_add_complete,
		output_sig_div,				-- calculate 1 over for sigmoid function for one output layer's perceptron
		output_sig_div_complete,
		learn,
		output_err_sub,
		output_err_sub_complete,
		output_err_mul,
		output_err_mul_complete,
		output_err_add,
		output_err_add_complete,
		output_delta_sub,
		output_delta_sub_complete,
		output_delta_mul,
		output_delta_mul_complete,
		output_delta_err_mul,
		output_delta_err_mul_complete,
		output_alpha_delta_mul,
		output_alpha_delta_mul_complete,
		output_update_weight_mul,
		output_update_weight_mul_complete,
		output_update_weight_load,
		output_update_weight_load_complete,
		output_update_weight_add,
		output_update_weight_add_complete,
		output_update_weight_save,
		output_update_weight_save_complete,
		output_update_bias_load,
		output_update_bias_load_complete,
		output_update_bias_add,
		output_update_bias_add_complete,
		output_update_bias_save,
		output_update_bias_save_complete,
		hidden_err_load,
		hidden_err_load_complete,
		hidden_err_mul,
		hidden_err_mul_complete,
		hidden_err_add,
		hidden_err_add_complete,
		hidden_delta_sub,
		hidden_delta_sub_complete,
		hidden_delta_mul,
		hidden_delta_mul_complete,
		hidden_delta_err_mul,
		hidden_delta_err_mul_complete,
		hidden_alpha_delta_mul,
		hidden_alpha_delta_mul_complete,
		hidden_update_weight_mul,
		hidden_update_weight_mul_complete,
		hidden_update_weight_load,
		hidden_update_weight_load_complete,
		hidden_update_weight_add,
		hidden_update_weight_add_complete,
		hidden_update_weight_save,
		hidden_update_weight_save_complete,
		hidden_update_bias_load,
		hidden_update_bias_load_complete,
		hidden_update_bias_add,
		hidden_update_bias_add_complete,
		hidden_update_bias_save,
		hidden_update_bias_save_complete,
		idle
	);
	SIGNAL state : states := init;


	-- squared error
	SIGNAL se : float := float_zero;

	-- learning flag
	SIGNAL learning : STD_LOGIC := '0';

	-- temp signals
	SIGNAL i, h, o : INTEGER := 0;
	SIGNAL f, e, a : float := float_zero;
	SIGNAL weight : float := float_zero;
	SIGNAL addr : INTEGER := 0;
BEGIN

outputs <= output_outputs;

-- flying spaghetti monster (fsm) triggered at rising edge
fsm: PROCESS(clock, reset) IS
BEGIN
	IF (reset = '1') THEN
		ready <= '0';
		state <= init;
		float_alu_mode <= idle;
		sram_mode <= idle;
	ELSIF (clock = '1' AND clock'event) THEN
		IF (float_alu_mode /= idle) THEN
			float_alu_mode <= idle;
		ELSIF (sram_mode /= idle) THEN
			sram_mode <= idle;
		ELSIF (float_alu_ready = '0' OR sram_ready = '0' ) THEN

		ELSE
			CASE state IS
			WHEN init =>
				addr <= 0;
				ready <= '0';
				state <= init_weight;
				mse <= float_zero;
			
			WHEN init_weight =>
				sram_addr <= std_logic_vector(to_unsigned(addr, 17));
				sram_input <= lfsr_output(15 downto 15) & "011" & lfsr_output(14 downto 11) & "0" & lfsr_output(10 downto 0) & "000000000000";
				
				sram_mode <= write;
				state <= init_weight_complete;
			WHEN init_weight_complete =>
				if( addr = ((N_I + 1) * N_H + (N_H + 1) * N_O) - 1 ) then
					state <= idle;
				else
					addr <= addr + 1;
					state <= init_weight;
				end if;


			--
			-- normal run operation start here
			--
			WHEN run =>
				ready <= '0';
				-- initialize perceptrons to have a zero output
				hidden_outputs <= (others => float_zero);
				output_outputs <= (others => float_zero);
				h <= 0;
				state <= hidden_weighted_bias_load;

			-- first load bias weight into sum
			WHEN hidden_weighted_bias_load =>
				sram_mode <= read;
				sram_addr <= std_logic_vector(to_unsigned((N_I * N_H + h), 17));
				state <= hidden_weighted_bias_load_complete;
			WHEN hidden_weighted_bias_load_complete =>
				hidden_outputs(h) <= sram_output;
				i <= 0;
				state <= hidden_weighted_value_load;

			-- sum up all weighted input to the hidden layer
			WHEN hidden_weighted_value_load =>
				sram_mode <= read;
				sram_addr <= std_logic_vector(to_unsigned((i * N_H + h), 17));
				state <= hidden_weighted_value_load_complete;
			WHEN hidden_weighted_value_load_complete =>
				weight <= sram_output;
				state <= hidden_weighted_value_mul;
			WHEN hidden_weighted_value_mul =>
				-- weighted value = weight * value
				float_alu_a <= weight;
				float_alu_b <= inputs(i);
				float_alu_mode <= mul;
				state <= hidden_weighted_value_mul_complete;
			WHEN hidden_weighted_value_mul_complete =>
				f <= float_alu_c;
				state <= hidden_weighted_value_add;
			WHEN hidden_weighted_value_add =>
				-- sum += weighted value
				float_alu_a <= hidden_outputs(h);
				float_alu_b <= f;
				float_alu_mode <= add;
				state <= hidden_weighted_value_add_complete;
			WHEN hidden_weighted_value_add_complete =>
				hidden_outputs(h) <= float_alu_c;
				IF (i = N_I - 1) THEN
					state <= hidden_sig_neg;
				ELSE
					i <= i + 1;
					state <= hidden_weighted_value_load;
				END IF;

			-- start sigmoid calculation
			WHEN hidden_sig_neg =>
				-- sum = -sum
				hidden_outputs(h)(31) <= not hidden_outputs(h)(31);
				state <= hidden_sig_exp;
			WHEN hidden_sig_exp =>
				-- output = exp(-sum)
				float_alu_a <= hidden_outputs(h);
				float_alu_mode <= exp;
				state <= hidden_sig_exp_complete;
			WHEN hidden_sig_exp_complete =>
				hidden_outputs(h) <= float_alu_c;
				state <= hidden_sig_add;
			WHEN hidden_sig_add =>
				-- output = exp(-sum) + 1.0
				float_alu_a <= hidden_outputs(h);
				float_alu_b <= float_one;
				float_alu_mode <= add;
				state <= hidden_sig_add_complete;
			WHEN hidden_sig_add_complete =>
				hidden_outputs(h) <= float_alu_c;
				state <= hidden_sig_div;
			WHEN hidden_sig_div =>
				-- output = 1.0 / (exp(-sum) + 1.0)
				float_alu_a <= float_one;
				float_alu_b <= hidden_outputs(h);
				float_alu_mode <= div;
				state <= hidden_sig_div_complete;
			WHEN hidden_sig_div_complete =>
				hidden_outputs(h) <= float_alu_c;
				IF (h = N_H - 1) THEN
					o <= 0;
					state <= output_weighted_bias_load;
				ELSE
					h <= h + 1;
					state <= hidden_weighted_bias_load;
				END IF;


			-- load bias for output layer
			WHEN output_weighted_bias_load =>
				sram_addr <= std_logic_vector(to_unsigned(((N_I + 1) * N_H + N_O * N_H + o), 17));
				sram_mode <= read;
				state <= output_weighted_bias_load_complete;
			WHEN output_weighted_bias_load_complete =>
				output_outputs(o) <= sram_output;
				h <= 0;
				state <= output_weighted_value_load;

			-- sum up all weighted value from hidden layer
			WHEN output_weighted_value_load =>
				sram_mode <= read;
				sram_addr <= std_logic_vector(to_unsigned(((N_I + 1) * N_H + N_O * h + o), 17));
				state <= output_weighted_value_load_complete;
			WHEN output_weighted_value_load_complete =>
				weight <= sram_output;
				state <= output_weighted_value_mul;
			WHEN output_weighted_value_mul =>
				-- weighted value = weight * value
				float_alu_a <= weight;
				float_alu_b <= hidden_outputs(h);
				float_alu_mode <= mul;
				state <= output_weighted_value_mul_complete;
			WHEN output_weighted_value_mul_complete =>
				f <= float_alu_c;
				state <= output_weighted_value_add;
			WHEN output_weighted_value_add =>
				-- sum += weighted value
				float_alu_a <= output_outputs(o);
				float_alu_b <= f;
				float_alu_mode <= add;
				state <= output_weighted_value_add_complete;
			WHEN output_weighted_value_add_complete =>
				output_outputs(o) <= float_alu_c;
				IF (h = N_H - 1) THEN
					state <= output_sig_neg;
				ELSE
					h <= h + 1;
					state <= output_weighted_value_load;
				END IF;

			-- start sigmoid calculation for output layer
			WHEN output_sig_neg =>
				-- sum = -sum
				output_outputs(o)(31) <= not output_outputs(o)(31);
				state <= output_sig_exp;
			WHEN output_sig_exp =>
				-- output = exp(-sum)
				float_alu_a <= output_outputs(o);
				float_alu_mode <= exp;
				state <= output_sig_exp_complete;
			WHEN output_sig_exp_complete =>
				output_outputs(o) <= float_alu_c;
				state <= output_sig_add;
			WHEN output_sig_add =>
				-- output = exp(-sum) + 1.0
				float_alu_a <= output_outputs(o);
				float_alu_b <= float_one;
				float_alu_mode <= add;
				state <= output_sig_add_complete;
			WHEN output_sig_add_complete =>
				output_outputs(o) <= float_alu_c;
				state <= output_sig_div;
			WHEN output_sig_div =>
				-- output = 1.0 / (exp(-sum) + 1.0)
				float_alu_a <= float_one;
				float_alu_b <= output_outputs(o);
				float_alu_mode <= div;
				state <= output_sig_div_complete;
			WHEN output_sig_div_complete =>
				output_outputs(o) <= float_alu_c;
				IF (o = N_O - 1) THEN
					IF (learning = '1') THEN
						state <= learn;
					ELSE
						state <= idle;
					END IF;
				ELSE
					o <= o + 1;
					state <= output_weighted_bias_load;
				END IF;
				





			--
			-- learn operation here
			--
			WHEN learn =>
				se <= float_zero;
				-- init deltas to zeros
				hidden_deltas <= (others => float_zero);
				output_deltas <= (others => float_zero);
				o <= 0;
				state <= output_err_sub;


			-- output layer error
			WHEN output_err_sub =>
				-- error = target - output
				float_alu_a <= targets(o);
				float_alu_b <= output_outputs(o);
				float_alu_mode <= sub;
				state <= output_err_sub_complete;
			WHEN output_err_sub_complete =>
				f <= float_alu_c;
				state <= output_err_mul;
			WHEN output_err_mul =>
				-- error^2 = error * error
				float_alu_a <= f;
				float_alu_b <= f;
				float_alu_mode <= mul;
				state <= output_err_mul_complete;
			WHEN output_err_mul_complete =>
				e <= float_alu_c;
				state <= output_err_add;
			WHEN output_err_add =>
				-- se += error^2
				float_alu_a <= se;
				float_alu_b <= e;
				float_alu_mode <= add;
				state <= output_err_add_complete;
			WHEN output_err_add_complete =>
				se <= float_alu_c;
				state <= output_delta_sub;

			-- calculate delta for output layer
			WHEN output_delta_sub =>
				-- delta = 1.0 - output
				float_alu_a <= float_one;
				float_alu_b <= output_outputs(o);
				float_alu_mode <= sub;
				state <= output_delta_sub_complete;
			WHEN output_delta_sub_complete =>
				output_deltas(o) <= float_alu_c;
				state <= output_delta_mul;
			WHEN output_delta_mul =>
				-- delta = output * (1.0 - output)
				float_alu_a <= output_outputs(o);
				float_alu_b <= output_deltas(o);
				float_alu_mode <= mul;
				state <= output_delta_mul_complete;
			WHEN output_delta_mul_complete =>
				output_deltas(o) <= float_alu_c;
				state <= output_delta_err_mul;
			WHEN output_delta_err_mul =>
				-- delta = error * output * (1.0 - output)
				float_alu_a <= f;
				float_alu_b <= output_deltas(o);
				float_alu_mode <= mul;
				state <= output_delta_err_mul_complete;
			WHEN output_delta_err_mul_complete =>
				output_deltas(o) <= float_alu_c;
				state <= output_alpha_delta_mul;
			WHEN output_alpha_delta_mul =>
				-- alpha * delta
				float_alu_a <= alpha;
				float_alu_b <= output_deltas(o);
				float_alu_mode <= mul;
				state <= output_alpha_delta_mul_complete;
			WHEN output_alpha_delta_mul_complete =>
				a <= float_alu_c;
				h <= 0;
				state <= output_update_weight_mul;
		
			-- update weight of each input connection
			WHEN output_update_weight_mul =>
				-- alpha * delta * connection value
				float_alu_a <= a;
				float_alu_b <= hidden_outputs(h);
				float_alu_mode <= mul;
				state <= output_update_weight_mul_complete;
			WHEN output_update_weight_mul_complete =>
				f <= float_alu_c;
				state <= output_update_weight_load;
			WHEN output_update_weight_load =>
				sram_addr <= std_logic_vector(to_unsigned(((N_I + 1) * N_H + N_O * h + o), 17));
				sram_mode <= read;
				state <= output_update_weight_load_complete;
			WHEN output_update_weight_load_complete =>
				weight <= sram_output;
				state <= output_update_weight_add;
			WHEN output_update_weight_add =>
				-- weight += alpha * delta * connection value
				float_alu_a <= weight;
				float_alu_b <= f;
				float_alu_mode <= add;
				state <= output_update_weight_add_complete;
			WHEN output_update_weight_add_complete =>
				weight <= float_alu_c;
				state <= output_update_weight_save;
			WHEN output_update_weight_save =>
				sram_addr <= std_logic_vector(to_unsigned(((N_I + 1) * N_H + N_O * h + o), 17));
				sram_mode <= write;
				sram_input <= weight;
				state <= output_update_weight_save_complete;
			WHEN output_update_weight_save_complete =>
				IF (h = N_H - 1) THEN
					state <= output_update_bias_load;
				ELSE
					h <= h + 1;
					state <= output_update_weight_mul;
				END IF;

			-- update bias weight
			WHEN output_update_bias_load =>
				sram_addr <= std_logic_vector(to_unsigned(((N_I + 1) * N_H + N_O * N_H + o), 17));
				sram_mode <= read;
				state <= output_update_bias_load_complete;
			WHEN output_update_bias_load_complete =>
				weight <= sram_output;
				state <= output_update_bias_add;
			WHEN output_update_bias_add =>
				-- weight += alpha * delta
				float_alu_a <= weight;
				float_alu_b <= a;
				float_alu_mode <= add;
				state <= output_update_bias_add_complete;
			WHEN output_update_bias_add_complete =>
				weight <= float_alu_c;
				state <= output_update_bias_save;
			WHEN output_update_bias_save =>
				sram_addr <= std_logic_vector(to_unsigned(((N_I + 1) * N_H + N_O * N_H + o), 17));
				sram_mode <= write;
				sram_input <= weight;
				state <= output_update_bias_save_complete;
			WHEN output_update_bias_save_complete =>
				IF (o = N_O - 1) THEN
					mse <= se;
					h <= 0;
					o <= 0;
					e <= float_zero;
					state <= hidden_err_load;
				ELSE
					o <= o + 1;
					state <= output_err_sub;
				END IF;




			-- hidden layer error
			WHEN hidden_err_load =>
				sram_addr <= std_logic_vector(to_unsigned(((N_I + 1) * N_H + N_O * h + o), 17));
				sram_mode <= read;
				state <= hidden_err_load_complete;
			WHEN hidden_err_load_complete =>
				weight <= sram_output;
				state <= hidden_err_mul;
			WHEN hidden_err_mul =>
				-- delta * weight
				float_alu_a <= output_deltas(o);
				float_alu_b <= weight;
				float_alu_mode <= mul;
				state <= hidden_err_mul_complete;
			WHEN hidden_err_mul_complete =>
				f <= float_alu_c;
				state <= hidden_err_add;
			WHEN hidden_err_add =>
				-- error += delta * weight
				float_alu_a <= e;
				float_alu_b <= f;
				float_alu_mode <= add;
				state <= hidden_err_add_complete;
			WHEN hidden_err_add_complete =>
				e <= float_alu_c;
				IF (o = N_O - 1) THEN
					state <= hidden_delta_sub;
				ELSE
					o <= o + 1;
					state <= hidden_err_load;
				END IF;

			-- calculate delta
			WHEN hidden_delta_sub =>
				-- delta = 1.0 - output
				float_alu_a <= float_one;
				float_alu_b <= hidden_outputs(h);
				float_alu_mode <= sub;
				state <= hidden_delta_sub_complete;
			WHEN hidden_delta_sub_complete =>
				hidden_deltas(h) <= float_alu_c;
				state <= hidden_delta_mul;
			WHEN hidden_delta_mul =>
				-- delta = output * (1.0 - output)
				float_alu_a <= hidden_outputs(h);
				float_alu_b <= hidden_deltas(h);
				float_alu_mode <= mul;
				state <= hidden_delta_mul_complete;
			WHEN hidden_delta_mul_complete =>
				hidden_deltas(h) <= float_alu_c;
				state <= hidden_delta_err_mul;
			WHEN hidden_delta_err_mul =>
				-- delta = error * output * (1.0 - output)
				float_alu_a <= e;
				float_alu_b <= hidden_deltas(h);
				float_alu_mode <= mul;
				state <= hidden_delta_err_mul_complete;
			WHEN hidden_delta_err_mul_complete =>
				hidden_deltas(h) <= float_alu_c;
				state <= hidden_alpha_delta_mul;
			WHEN hidden_alpha_delta_mul =>
				-- alpha * delta
				float_alu_a <= alpha;
				float_alu_b <= hidden_deltas(h);
				float_alu_mode <= mul;
				state <= hidden_alpha_delta_mul_complete;
			WHEN hidden_alpha_delta_mul_complete =>
				a <= float_alu_c;
				i <= 0;
				state <= hidden_update_weight_mul;

			-- update input weights
			WHEN hidden_update_weight_mul =>
				-- alpha * delta * connection value
				float_alu_a <= a;
				float_alu_b <= inputs(i);
				float_alu_mode <= mul;
				state <= hidden_update_weight_mul_complete;
			WHEN hidden_update_weight_mul_complete =>
				f <= float_alu_c;
				state <= hidden_update_weight_load;
			WHEN hidden_update_weight_load =>
				sram_addr <= std_logic_vector(to_unsigned((i * N_H + h), 17));
				sram_mode <= read;
				state <= hidden_update_weight_load_complete;
			WHEN hidden_update_weight_load_complete =>
				weight <= sram_output; 
				state <= hidden_update_weight_add;
			WHEN hidden_update_weight_add =>
				-- weight += alpha * delta * connection value
				float_alu_a <= weight;
				float_alu_b <= f;
				float_alu_mode <= add;
				state <= hidden_update_weight_add_complete;
			WHEN hidden_update_weight_add_complete =>
				weight <= float_alu_c;
				state <= hidden_update_weight_save;
			WHEN hidden_update_weight_save =>
				sram_addr <= std_logic_vector(to_unsigned((i * N_H + h), 17));
				sram_input <= weight;
				sram_mode <= write;
				state <= hidden_update_weight_save_complete;
			WHEN hidden_update_weight_save_complete =>
				weight <= sram_output;
				IF (i = N_I - 1) THEN
					state <= hidden_update_bias_load;
				ELSE
					i <= i + 1;
					state <= hidden_update_weight_mul;
				END IF;

			-- update hidden layer bias weight
			WHEN hidden_update_bias_load =>
				sram_addr <= std_logic_vector(to_unsigned((N_I * N_H + h), 17));
				sram_mode <= read;
				state <= hidden_update_bias_load_complete;
			WHEN hidden_update_bias_load_complete =>
				weight <= sram_output;
				state <= hidden_update_bias_add;
			WHEN hidden_update_bias_add =>
				-- weight += alpha * delta
				float_alu_a <= weight;
				float_alu_b <= a;
				float_alu_mode <= add;
				state <= hidden_update_bias_add_complete;
			WHEN hidden_update_bias_add_complete =>
				weight <= float_alu_c;
				state <= hidden_update_bias_save;
			WHEN hidden_update_bias_save =>
				sram_addr <= std_logic_vector(to_unsigned((N_I * N_H + h), 17));
				sram_mode <= write;
				sram_input <= weight;
				state <= hidden_update_bias_save_complete;
			WHEN hidden_update_bias_save_complete =>
				IF (h = N_H - 1) THEN
					state <= idle;
				ELSE
					h <= h + 1;
					o <= 0;
					state <= hidden_err_load;
				END IF;



			WHEN idle =>
				ready <= '1';
				CASE mode IS
				WHEN idle =>
					state <= idle;
				WHEN run =>
					ready <= '0';
					learning <= '0';
					state <= run;
				WHEN learn =>
					ready <= '0';
					learning <= '1';
					state <= run;
				WHEN others =>
					state <= idle;
				END CASE;

			WHEN others =>
				state <= init;
			END CASE;
		END IF;
	END IF;
END PROCESS;

END ARCHITECTURE ann;


