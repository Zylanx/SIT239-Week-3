module serial_adder (
	input i_clk,
	input i_reset,
	input i_load,
	input [2:0] i_x_data,
	input [2:0] i_y_data,
	
	output [2:0] o_sum,
	output o_carry
);
	
	// carry storage
	reg r_carry = 1'b0;
	
	wire w_x;
	wire w_y;
	
	reg r_sum = 1'b0;
	
	shift_register sr_x (
		.clk(i_clk),
		.sr_in(1'b0),
		.load(i_load),
		.data(i_x_data),
		.sr_out(w_x),
		.sr_p_out()
	);
	
	shift_register sr_y (
		.clk(i_clk),
		.sr_in(1'b0),
		.load(i_load),
		.data(i_y_data),
		.sr_out(w_y),
		.sr_p_out()
	);
	
	shift_register sr_sum (
		.clk(i_clk),
		.sr_in(r_sum),
		.load(1'b0),
		.data(3'd0),
		.sr_out(),
		.sr_p_out(o_sum)
	);
	
	// FSM states
	localparam
		state_no_carry = 1'd0,
		state_carry = 1'd1;
	
	// FSM state storage
	reg r_state = state_no_carry;
	reg r_next_state = state_no_carry;
	
	
	// State register block
	always @(posedge i_clk, posedge i_reset) begin
		if (i_reset) begin
			r_state <= state_no_carry;
		end
		else begin
			r_state <= r_next_state;
		end
	end
	
	// Next state block
	// Moore style FSM
	always @(r_state, r_carry) begin
		r_next_state <= r_state;
		
		case (r_state)
			state_no_carry:
				begin
					if (r_carry) begin
						r_next_state <= state_carry;
					end
				end
			state_carry:
				begin
					if (!r_carry) begin
						r_next_state <= state_no_carry;
					end
				end
		endcase
	end
	
	// Output block
	always @(r_state, w_x, w_y) begin
		r_sum = 1'b0;
		r_carry = 1'b0;
		
		case (r_state)
			state_no_carry:
				begin
					{r_carry, r_sum} = w_x + w_y;
				end
			state_carry:
				begin
					{r_carry, r_sum} = w_x + w_y + 2'b01;
				end
		endcase
	end
	
	assign o_carry = (r_state == state_carry);
	
endmodule