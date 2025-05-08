module LCD_display_string
(
	input [4:0] index,
	input [15:0] reg_msg,
	output reg [7:0] out
);
 always @ (reg_msg) begin
			case (reg_msg)
			16'd0: // Bem - vindo!
			begin
				case (index)
						5'h00: out <= 8'h54;
						5'h01: out <= 8'h42;
						5'h02: out <= 8'h65;
						5'h03: out <= 8'h6D;
						5'h04: out <= 8'h20;
						5'h05: out <= 8'h2D;
						5'h06: out <= 8'h20;
						5'h07: out <= 8'h76;
						5'h08: out <= 8'h69;
						5'h09: out <= 8'h6E;
						5'h0A: out <= 8'h64;
						5'h0B: out <= 8'h6F;
						5'h0C: out <= 8'h21;
						default: out <= 8'h20;
				endcase
			end
			16'd1: // Executando processo 1
			begin
			    case (index)
						  5'h00: out <= 8'h20;
                    5'h01: out <= 8'h45;
                    5'h02: out <= 8'h78;
                    5'h03: out <= 8'h65;
                    5'h04: out <= 8'h63;
                    5'h05: out <= 8'h75;
                    5'h06: out <= 8'h74;
                    5'h07: out <= 8'h61;
                    5'h08: out <= 8'h6E;
                    5'h09: out <= 8'h64;
                    5'h0A: out <= 8'h6F;
                    5'h0B: out <= 8'h20;
                    5'h0C: out <= 8'h20;
                    5'h0D: out <= 8'h20;
                    5'h0E: out <= 8'h20;
                    5'h0F: out <= 8'h20;
                    5'h10: out <= 8'h20;
                    5'h11: out <= 8'h20;
                    5'h12: out <= 8'h50;
                    5'h13: out <= 8'h72;
                    5'h14: out <= 8'h6F;
                    5'h15: out <= 8'h63;
                    5'h16: out <= 8'h65;
                    5'h17: out <= 8'h73;
                    5'h18: out <= 8'h73;
                    5'h19: out <= 8'h6F;
                    5'h1A: out <= 8'h20;
                    5'h1B: out <= 8'h20;
                    5'h1C: out <= 8'h31;
                    5'h1D: out <= 8'h2E;
                    5'h1E: out <= 8'h2E;
                    5'h1F: out <= 8'h2E;
	                default: out <= 8'h20;
				endcase
			end
			16'd2: // Executando processo 2
			begin
			    case (index)
						  5'h00: out <= 8'h20;
                    5'h01: out <= 8'h45;
                    5'h02: out <= 8'h78;
                    5'h03: out <= 8'h65;
                    5'h04: out <= 8'h63;
                    5'h05: out <= 8'h75;
                    5'h06: out <= 8'h74;
                    5'h07: out <= 8'h61;
                    5'h08: out <= 8'h6E;
                    5'h09: out <= 8'h64;
                    5'h0A: out <= 8'h6F;
                    5'h0B: out <= 8'h20;
                    5'h0C: out <= 8'h20;
                    5'h0D: out <= 8'h20;
                    5'h0E: out <= 8'h20;
                    5'h0F: out <= 8'h20;
                    5'h10: out <= 8'h20;
                    5'h11: out <= 8'h20;
                    5'h12: out <= 8'h50;
                    5'h13: out <= 8'h72;
                    5'h14: out <= 8'h6F;
                    5'h15: out <= 8'h63;
                    5'h16: out <= 8'h65;
                    5'h17: out <= 8'h73;
                    5'h18: out <= 8'h73;
                    5'h19: out <= 8'h6F;
                    5'h1A: out <= 8'h20;
                    5'h1B: out <= 8'h20;
                    5'h1C: out <= 8'h32;
                    5'h1D: out <= 8'h2E;
                    5'h1E: out <= 8'h2E;
                    5'h1F: out <= 8'h2E;
	                default: out <= 8'h20;
				endcase
			end
			16'd3: // Executando processo 3
			begin
			    case (index)
						  5'h00: out <= 8'h20;
                    5'h01: out <= 8'h45;
                    5'h02: out <= 8'h78;
                    5'h03: out <= 8'h65;
                    5'h04: out <= 8'h63;
                    5'h05: out <= 8'h75;
                    5'h06: out <= 8'h74;
                    5'h07: out <= 8'h61;
                    5'h08: out <= 8'h6E;
                    5'h09: out <= 8'h64;
                    5'h0A: out <= 8'h6F;
                    5'h0B: out <= 8'h20;
                    5'h0C: out <= 8'h20;
                    5'h0D: out <= 8'h20;
                    5'h0E: out <= 8'h20;
                    5'h0F: out <= 8'h20;
                    5'h10: out <= 8'h20;
                    5'h11: out <= 8'h20;
                    5'h12: out <= 8'h50;
                    5'h13: out <= 8'h72;
                    5'h14: out <= 8'h6F;
                    5'h15: out <= 8'h63;
                    5'h16: out <= 8'h65;
                    5'h17: out <= 8'h73;
                    5'h18: out <= 8'h73;
                    5'h19: out <= 8'h6F;
                    5'h1A: out <= 8'h20;
                    5'h1B: out <= 8'h20;
                    5'h1C: out <= 8'h33;
                    5'h1D: out <= 8'h2E;
                    5'h1E: out <= 8'h2E;
                    5'h1F: out <= 8'h2E;
	                default: out <= 8'h20;
				endcase
			end
			16'd4: // Executando processo 4
			begin
			    case (index)
			           5'h00: out <= 8'h20;
                    5'h01: out <= 8'h45;
                    5'h02: out <= 8'h78;
                    5'h03: out <= 8'h65;
                    5'h04: out <= 8'h63;
                    5'h05: out <= 8'h75;
                    5'h06: out <= 8'h74;
                    5'h07: out <= 8'h61;
                    5'h08: out <= 8'h6E;
                    5'h09: out <= 8'h64;
                    5'h0A: out <= 8'h6F;
                    5'h0B: out <= 8'h20;
                    5'h0C: out <= 8'h20;
                    5'h0D: out <= 8'h20;
                    5'h0E: out <= 8'h20;
                    5'h0F: out <= 8'h20;
                    5'h10: out <= 8'h20;
                    5'h11: out <= 8'h20;
                    5'h12: out <= 8'h50;
                    5'h13: out <= 8'h72;
                    5'h14: out <= 8'h6F;
                    5'h15: out <= 8'h63;
                    5'h16: out <= 8'h65;
                    5'h17: out <= 8'h73;
                    5'h18: out <= 8'h73;
                    5'h19: out <= 8'h6F;
                    5'h1A: out <= 8'h20;
                    5'h1B: out <= 8'h20;
                    5'h1C: out <= 8'h34;
                    5'h1D: out <= 8'h2E;
                    5'h1E: out <= 8'h2E;
                    5'h1F: out <= 8'h2E;
	                default: out <= 8'h20;
				endcase
			end
			16'd5: // Executando processo 5
			begin
			    case (index)
			           5'h00: out <= 8'h20;
                    5'h01: out <= 8'h45;
                    5'h02: out <= 8'h78;
                    5'h03: out <= 8'h65;
                    5'h04: out <= 8'h63;
                    5'h05: out <= 8'h75;
                    5'h06: out <= 8'h74;
                    5'h07: out <= 8'h61;
                    5'h08: out <= 8'h6E;
                    5'h09: out <= 8'h64;
                    5'h0A: out <= 8'h6F;
                    5'h0B: out <= 8'h20;
                    5'h0C: out <= 8'h20;
                    5'h0D: out <= 8'h20;
                    5'h0E: out <= 8'h20;
                    5'h0F: out <= 8'h20;
                    5'h10: out <= 8'h20;
                    5'h11: out <= 8'h20;
                    5'h12: out <= 8'h50;
                    5'h13: out <= 8'h72;
                    5'h14: out <= 8'h6F;
                    5'h15: out <= 8'h63;
                    5'h16: out <= 8'h65;
                    5'h17: out <= 8'h73;
                    5'h18: out <= 8'h73;
                    5'h19: out <= 8'h6F;
                    5'h1A: out <= 8'h20;
                    5'h1B: out <= 8'h20;
                    5'h1C: out <= 8'h35;
                    5'h1D: out <= 8'h2E;
                    5'h1E: out <= 8'h2E;
                    5'h1F: out <= 8'h2E;
	                default: out <= 8'h20;
				endcase
			end
			16'd6: // Executando processo 6
			begin
			    case (index)
			           5'h00: out <= 8'h20;
                    5'h01: out <= 8'h45;
                    5'h02: out <= 8'h78;
                    5'h03: out <= 8'h65;
                    5'h04: out <= 8'h63;
                    5'h05: out <= 8'h75;
                    5'h06: out <= 8'h74;
                    5'h07: out <= 8'h61;
                    5'h08: out <= 8'h6E;
                    5'h09: out <= 8'h64;
                    5'h0A: out <= 8'h6F;
                    5'h0B: out <= 8'h20;
                    5'h0C: out <= 8'h20;
                    5'h0D: out <= 8'h20;
                    5'h0E: out <= 8'h20;
                    5'h0F: out <= 8'h20;
                    5'h10: out <= 8'h20;
                    5'h11: out <= 8'h20;
                    5'h12: out <= 8'h50;
                    5'h13: out <= 8'h72;
                    5'h14: out <= 8'h6F;
                    5'h15: out <= 8'h63;
                    5'h16: out <= 8'h65;
                    5'h17: out <= 8'h73;
                    5'h18: out <= 8'h73;
                    5'h19: out <= 8'h6F;
                    5'h1A: out <= 8'h20;
                    5'h1B: out <= 8'h20;
                    5'h1C: out <= 8'h36;
                    5'h1D: out <= 8'h2E;
                    5'h1E: out <= 8'h2E;
                    5'h1F: out <= 8'h2E;
	                default: out <= 8'h20;
				endcase
			end
			16'd7: // Executando processo 7
			begin
			    case (index)
			           5'h00: out <= 8'h20;
                    5'h01: out <= 8'h45;
                    5'h02: out <= 8'h78;
                    5'h03: out <= 8'h65;
                    5'h04: out <= 8'h63;
                    5'h05: out <= 8'h75;
                    5'h06: out <= 8'h74;
                    5'h07: out <= 8'h61;
                    5'h08: out <= 8'h6E;
                    5'h09: out <= 8'h64;
                    5'h0A: out <= 8'h6F;
                    5'h0B: out <= 8'h20;
                    5'h0C: out <= 8'h20;
                    5'h0D: out <= 8'h20;
                    5'h0E: out <= 8'h20;
                    5'h0F: out <= 8'h20;
                    5'h10: out <= 8'h20;
                    5'h11: out <= 8'h20;
                    5'h12: out <= 8'h50;
                    5'h13: out <= 8'h72;
                    5'h14: out <= 8'h6F;
                    5'h15: out <= 8'h63;
                    5'h16: out <= 8'h65;
                    5'h17: out <= 8'h73;
                    5'h18: out <= 8'h73;
                    5'h19: out <= 8'h6F;
                    5'h1A: out <= 8'h20;
                    5'h1B: out <= 8'h20;
                    5'h1C: out <= 8'h37;
                    5'h1D: out <= 8'h2E;
                    5'h1E: out <= 8'h2E;
                    5'h1F: out <= 8'h2E;
	                default: out <= 8'h20;
				endcase
			end
			16'd8: // Executando processo 8
			begin
			    case (index)
			           5'h00: out <= 8'h20;
                    5'h01: out <= 8'h45;
                    5'h02: out <= 8'h78;
                    5'h03: out <= 8'h65;
                    5'h04: out <= 8'h63;
                    5'h05: out <= 8'h75;
                    5'h06: out <= 8'h74;
                    5'h07: out <= 8'h61;
                    5'h08: out <= 8'h6E;
                    5'h09: out <= 8'h64;
                    5'h0A: out <= 8'h6F;
                    5'h0B: out <= 8'h20;
                    5'h0C: out <= 8'h20;
                    5'h0D: out <= 8'h20;
                    5'h0E: out <= 8'h20;
                    5'h0F: out <= 8'h20;
                    5'h10: out <= 8'h20;
                    5'h11: out <= 8'h20;
                    5'h12: out <= 8'h50;
                    5'h13: out <= 8'h72;
                    5'h14: out <= 8'h6F;
                    5'h15: out <= 8'h63;
                    5'h16: out <= 8'h65;
                    5'h17: out <= 8'h73;
                    5'h18: out <= 8'h73;
                    5'h19: out <= 8'h6F;
                    5'h1A: out <= 8'h20;
                    5'h1B: out <= 8'h20;
                    5'h1C: out <= 8'h38;
                    5'h1D: out <= 8'h2E;
                    5'h1E: out <= 8'h2E;
                    5'h1F: out <= 8'h2E;
	                default: out <= 8'h20;
				endcase
			end
			16'd9: // Executando processo 9
			begin
			    case (index)
			           5'h00: out <= 8'h20;
                    5'h01: out <= 8'h45;
                    5'h02: out <= 8'h78;
                    5'h03: out <= 8'h65;
                    5'h04: out <= 8'h63;
                    5'h05: out <= 8'h75;
                    5'h06: out <= 8'h74;
                    5'h07: out <= 8'h61;
                    5'h08: out <= 8'h6E;
                    5'h09: out <= 8'h64;
                    5'h0A: out <= 8'h6F;
                    5'h0B: out <= 8'h20;
                    5'h0C: out <= 8'h20;
                    5'h0D: out <= 8'h20;
                    5'h0E: out <= 8'h20;
                    5'h0F: out <= 8'h20;
                    5'h10: out <= 8'h20;
                    5'h11: out <= 8'h20;
                    5'h12: out <= 8'h50;
                    5'h13: out <= 8'h72;
                    5'h14: out <= 8'h6F;
                    5'h15: out <= 8'h63;
                    5'h16: out <= 8'h65;
                    5'h17: out <= 8'h73;
                    5'h18: out <= 8'h73;
                    5'h19: out <= 8'h6F;
                    5'h1A: out <= 8'h20;
                    5'h1B: out <= 8'h20;
                    5'h1C: out <= 8'h39;
                    5'h1D: out <= 8'h2E;
                    5'h1E: out <= 8'h2E;
                    5'h1F: out <= 8'h2E;
	                default: out <= 8'h20;
				endcase
			end
			16'd10: // Executando processo 10
			begin
			    case (index)
			           5'h00: out <= 8'h20;
                    5'h01: out <= 8'h45;
                    5'h02: out <= 8'h78;
                    5'h03: out <= 8'h65;
                    5'h04: out <= 8'h63;
                    5'h05: out <= 8'h75;
                    5'h06: out <= 8'h74;
                    5'h07: out <= 8'h61;
                    5'h08: out <= 8'h6E;
                    5'h09: out <= 8'h64;
                    5'h0A: out <= 8'h6F;
                    5'h0B: out <= 8'h20;
                    5'h0C: out <= 8'h20;
                    5'h0D: out <= 8'h20;
                    5'h0E: out <= 8'h20;
                    5'h0F: out <= 8'h20;
                    5'h10: out <= 8'h20;
                    5'h11: out <= 8'h20;
                    5'h12: out <= 8'h50;
                    5'h13: out <= 8'h72;
                    5'h14: out <= 8'h6F;
                    5'h15: out <= 8'h63;
                    5'h16: out <= 8'h65;
                    5'h17: out <= 8'h73;
                    5'h18: out <= 8'h73;
                    5'h19: out <= 8'h6F;
                    5'h1A: out <= 8'h20;
                    5'h1B: out <= 8'h31;
                    5'h1C: out <= 8'h30;
                    5'h1D: out <= 8'h2E;
                    5'h1E: out <= 8'h2E;
                    5'h1F: out <= 8'h2E;
	                default: out <= 8'h20;
				endcase
			end
			16'd11: // Entrada
			begin
				case (index)
						5'h00: out <= 8'h45;
						5'h01: out <= 8'h6e;
						5'h02: out <= 8'h74;
						5'h03: out <= 8'h72;
						5'h04: out <= 8'h61;
						5'h05: out <= 8'h64;
						5'h06: out <= 8'h61;				
						default: out <= 8'h20;
				endcase
			end
			
			16'd12: // Trocando contexto... ok
			begin
				case (index)
						  5'h00: out <= 8'h20;
                    5'h01: out <= 8'h54;
                    5'h02: out <= 8'h72;
                    5'h03: out <= 8'h6F;
                    5'h04: out <= 8'h63;
                    5'h05: out <= 8'h61;
                    5'h06: out <= 8'h6E;
                    5'h07: out <= 8'h64;
                    5'h08: out <= 8'h6F;
                    5'h09: out <= 8'h20;
                    5'h0A: out <= 8'h20;
                    5'h0B: out <= 8'h20;
                    5'h0C: out <= 8'h20;
                    5'h0D: out <= 8'h20;
                    5'h0E: out <= 8'h20;
                    5'h0F: out <= 8'h20;
                    5'h10: out <= 8'h20;
                    5'h11: out <= 8'h43;
                    5'h12: out <= 8'h6F;
                    5'h13: out <= 8'h6E;
                    5'h14: out <= 8'h74;
                    5'h15: out <= 8'h65;
                    5'h16: out <= 8'h78;
                    5'h17: out <= 8'h74;
                    5'h18: out <= 8'h6F;
                    5'h19: out <= 8'h20;
                    5'h1A: out <= 8'h20;
                    5'h1B: out <= 8'h20;
                    5'h1C: out <= 8'h20;
                    5'h1D: out <= 8'h20;
                    5'h1E: out <= 8'h20;
                    5'h1F: out <= 8'h20;

				default: out <= 8'h20;
				endcase
			end
			
			16'd13: // Resultado
			begin
				case (index)
					5'h00: out <= 8'h52;
					5'h01: out <= 8'h65;
					5'h02: out <= 8'h73;
					5'h03: out <= 8'h75;
					5'h04: out <= 8'h6c;
					5'h05: out <= 8'h74;
					5'h06: out <= 8'h61;
					5'h07: out <= 8'h64;
					5'h08: out <= 8'h6f;
					default: out <= 8'h20;
				endcase
			end
			
			16'd14: // Fim...
			begin
				case(index)
					5'h00: out <= 8'h46;
					5'h01: out <= 8'h69;
					5'h02: out <= 8'h6d;
					5'h03: out <= 8'h2e;
					5'h04: out <= 8'h2e;
					5'h05: out <= 8'h2e;
					default: out <= 8'h20;
				endcase
			end

			16'd15: // Executando ...
			begin
				case(index)
					5'h00: out <= 8'h45;
					5'h01: out <= 8'h78;
					5'h02: out <= 8'h65;
					5'h03: out <= 8'h63;
					5'h04: out <= 8'h75;
					5'h05: out <= 8'h74;
					5'h06: out <= 8'h61;
					5'h07: out <= 8'h6e;
					5'h08: out <= 8'h64;
					5'h09: out <= 8'h6f;
					5'h0A: out <= 8'h2e;
					5'h0B: out <= 8'h2e;
					5'h0C: out <= 8'h2e;
					5'h0D: out <= 8'h20;
					5'h0E: out <= 8'h20;
					5'h0F: out <= 8'h20;
					5'h10: out <= 8'h20;
					5'h11: out <= 8'h20;
					5'h12: out <= 8'h20;
					5'h13: out <= 8'h20;
					5'h14: out <= 8'h20;
					5'h15: out <= 8'h20;
					5'h16: out <= 8'h20;
					default: out <= 8'h20;
				endcase
			end
			16'd16: // Fim processo 
			begin
			    case (index)
					5'h00: out <= 8'h66;
					5'h01: out <= 8'h69;
					5'h02: out <= 8'h6D;
					5'h03: out <= 8'h20;
					5'h04: out <= 8'h70;
					5'h05: out <= 8'h72;
					5'h06: out <= 8'h6F;
					5'h07: out <= 8'h63;
					5'h08: out <= 8'h65;
					5'h09: out <= 8'h73;
					5'h0A: out <= 8'h73;
					5'h0B: out <= 8'h6F;
					5'h0C: out <= 8'h20;
					5'h0D: out <= 8'h20;
					5'h0E: out <= 8'h20;
					5'h0F: out <= 8'h20;
					5'h10: out <= 8'h20;
					5'h11: out <= 8'h20;
					5'h12: out <= 8'h20;
					5'h13: out <= 8'h20;
					5'h14: out <= 8'h20;
					5'h15: out <= 8'h20;
					5'h16: out <= 8'h20;
	            default: out <= 8'h20;
				endcase
            end
			default:
				case (index)
					default: out <= 8'h20;
				endcase
			
		
		endcase 
		
	end
	  
endmodule