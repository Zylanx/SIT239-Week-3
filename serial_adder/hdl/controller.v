module controller (
	input i_clk,
	
	output reg o_adder_load,
	output reg o_led_load
);
	
	localparam [1:0]
		state_load = 0,
		state_sum = 1,
		state_output = 2;
	
	// FSM state storage
	reg [1:0] r_state = state_load;
	reg [1:0] r_next_state = state_load;
	
	reg [1:0] r_load_counter = 2'b0;
	
	// State register block
	always @(posedge i_clk) begin
		r_state <= r_next_state;
	end
	
	// Timer incrementing and reset
	always @(posedge i_clk) begin
		if (r_state != r_next_state) begin
			r_load_counter <= 0;
		end
		else begin
			r_load_counter <= r_load_counter + 2'd1;
		end
	end
	
	// Next state block
	// Moore style FSM
	always @(r_state, r_load_counter) begin
		r_next_state <= r_state;
		
		case (r_state)
			state_load:
				begin
					r_next_state <= state_sum;
				end
			state_sum:
				begin
					if (r_load_counter >= 2) begin
						r_next_state <= state_output;
					end
				end
			state_output:
				begin
					r_next_state <= state_load;
				end
		endcase
	end
	
	// Output block
	always @(r_state) begin
		o_adder_load = 1'b0;
		o_led_load = 1'b0;
		
		case (r_state)
			state_load:
				begin
					o_adder_load = 1'b1;
				end
			state_sum:
				begin
				end
			state_output:
				begin
					o_led_load = 1'b1;
				end
		endcase
	end
	
//	always @(posedge i_clk) begin
//		if (r_state == state_output) begin
//			o_led_load <= 1'b1;
//		end
//		else begin
//			o_led_load <= 1'b0;
//		end
//	end
endmodule