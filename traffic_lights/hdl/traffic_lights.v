module traffic_lights (
	input i_clk,
	input i_reset,
	
	// Each pin is {red, orange, green?}
	output reg [2:0] o_highway_lights = 3'b000,
	output reg [2:0] o_country_lights = 3'b000
);
	// We are using a gated Mealy FSM for this design

	// State values for FSM
	localparam [2:0]
		state_0 = 0,
		state_1 = 1,
		state_2 = 2,
		state_3 = 3,
		state_4 = 4,
		state_5 = 5;
	
	// Timing values for lights
	localparam highway_green_time = 28'd500_000_000;
	localparam country_green_time = 28'd250_000_000;
	localparam orange_time = 28'd100_000_000;
	localparam clearing_time = 28'd50_000_000;
	
	// Gating of the outputs
	reg [2:0] r_new_highway_lights = 3'b000;
	reg [2:0] r_new_country_lights = 3'b000;
	
	// FSM State Registers
	reg [2:0] r_state = state_0;
	reg [2:0] r_state_next = state_0;
	
	// Timing counter
	reg [27:0] r_counter = 0;
	
	// Output gating
	always @(posedge i_clk, posedge i_reset) begin
		if (i_reset) begin
			o_highway_lights <= 0;
			o_country_lights <= 0;
		end
		else begin
			o_highway_lights <= r_new_highway_lights;
			o_country_lights <= r_new_country_lights;
		end
	end
	
	// State register block
	always @(posedge i_clk, posedge i_reset) begin
		if (i_reset) begin
			r_state <= state_0;
		end
		else begin
			r_state <= r_state_next;
		end
	end
	
	// Timer incrementing and reset
	always @(posedge i_clk, posedge i_reset) begin
		if (i_reset) begin
			r_counter <= 0;
		end
		else begin
			if (r_state != r_state_next) begin
				r_counter <= 0;
			end
			else begin
				r_counter <= r_counter + 1;
			end
		end
	end
	
	// Next state logic
	always @(r_counter, r_state) begin
		r_state_next = r_state;
		
		r_new_highway_lights = 3'b0;
		r_new_country_lights = 3'b0;
		
		case (r_state)
			state_0:
				begin
					if (r_counter >= highway_green_time) begin
						r_new_highway_lights = 3'b010;
						r_new_country_lights = 3'b100;
						
						r_state_next = state_1;
					end
					else begin
						r_new_highway_lights = 3'b001;
						r_new_country_lights = 3'b100;
						
						r_state_next = state_0;
					end
				end
			state_1: 
				begin
					if (r_counter >= orange_time) begin
						r_new_highway_lights = 3'b100;
						r_new_country_lights = 3'b100;
						
						r_state_next = state_2;
					end
					else begin
						r_new_highway_lights = 3'b010;
						r_new_country_lights = 3'b100;
						
						r_state_next = state_1;
					end
				end
			state_2:
				begin
					if (r_counter >= clearing_time) begin
						r_new_highway_lights = 3'b100;
						r_new_country_lights = 3'b001;
						
						r_state_next = state_3;
					end
					else begin
						r_new_highway_lights = 3'b100;
						r_new_country_lights = 3'b100;
						
						r_state_next = state_2;
					end
				end
			state_3:
				begin
					if (r_counter >= country_green_time) begin
						r_new_highway_lights = 3'b100;
						r_new_country_lights = 3'b010;
						
						r_state_next = state_4;
					end
					else begin
						r_new_highway_lights = 3'b100;
						r_new_country_lights = 3'b001;
						
						r_state_next = state_3;
					end
				end
			state_4:
				begin
					if (r_counter >= orange_time) begin
						r_new_highway_lights = 3'b100;
						r_new_country_lights = 3'b100;
						
						r_state_next = state_5;
					end
					else begin
						r_new_highway_lights = 3'b100;
						r_new_country_lights = 3'b010;
						
						r_state_next = state_4;
					end
				end
			state_5:
				begin
					if (r_counter >= clearing_time) begin
						r_new_highway_lights = 3'b001;
						r_new_country_lights = 3'b100;
						
						r_state_next = state_0;
					end
					else begin
						r_new_highway_lights = 3'b100;
						r_new_country_lights = 3'b100;
						
						r_state_next = state_5;
					end
				end
		endcase
	end
	
endmodule