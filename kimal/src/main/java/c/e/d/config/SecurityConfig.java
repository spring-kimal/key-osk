package c.e.d.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.csrf.CookieCsrfTokenRepository;

import c.e.d.service.UserDetailsServiceImpl;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

		@Autowired
		private UserDetailsServiceImpl userDetails;
		
		@Bean
		public static PasswordEncoder passwordEncoder() {
			return new BCryptPasswordEncoder();
		}
		
		public void configure(WebSecurity web) throws Exception{
			web.ignoring().antMatchers("/css/**", "/js/**", "/images/**");
		}
		
		public void configure(AuthenticationManagerBuilder auth) throws Exception {
			auth.userDetailsService(userDetails).passwordEncoder(passwordEncoder());
//			System.out.println(passwordEncoder().encode("1111"));
		}
		
		public void configure(HttpSecurity http) throws Exception {
			http
				.authorizeRequests()
					//.antMatchers("/mypoint/**").hasAnyAuthority("QUERY","WRITE")//�젒洹쇨텒�븳
					.antMatchers("/searchAll", "/itemUpdate", "/itemAdd", "maechool").hasRole("admin")
					.antMatchers("/**").permitAll()
					.anyRequest().authenticated()
					.and()
				.formLogin()
					.defaultSuccessUrl("/")
					.permitAll()
					.and()
				.logout()
					.logoutUrl("/logout")
					.logoutSuccessUrl("/")
					.invalidateHttpSession(true)
					.and()
				.exceptionHandling()
					.accessDeniedPage("/denied")
					.and()
				.csrf()
					.csrfTokenRepository(CookieCsrfTokenRepository.withHttpOnlyFalse());
			}
		
		public static void main(String[] args) {
			System.out.println(passwordEncoder().encode("admin"));
		}
}
