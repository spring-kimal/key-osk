package c.e.d.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import c.e.d.data.Admin;
import c.e.d.mapper.AdminMapper;

@Service
public class UserDetailsServiceImpl implements UserDetailsService{
	
	@Autowired
	private AdminMapper adminMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Optional<Admin> dbuser = adminMapper.findById(username);
		if(dbuser.isEmpty()) {
			throw new UsernameNotFoundException("invalid userrrr");
		}
		
		
		List<GrantedAuthority> auths = new ArrayList<>();
		auths.add(new SimpleGrantedAuthority("QUERY"));
		
		auths.add(new SimpleGrantedAuthority("WRITE"));
		
		
		UserDetails ud = User
				.withUsername(dbuser.get().getAdminId())
				.password(dbuser.get().getAdminPw())
				.authorities(auths)
				.roles("admin")
				.build();
		return ud;
				
	}

}
