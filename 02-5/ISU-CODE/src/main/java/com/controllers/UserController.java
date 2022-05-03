package com.controllers;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bean.DTOTitleDesc;
import com.bean.OTPTable;
import com.bean.Post;
import com.bean.Questions;
import com.bean.Tutorial;
import com.bean.User;
import com.dao.OTPRepo;
import com.dao.PostRepo;
import com.dao.QuestionRepo;
import com.dao.TutorialRepository;
import com.dao.UserRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.utility.Mailer;

@Controller
@RequestMapping("/isucode")
public class UserController {
	
	@Autowired UserRepository userRepository;
	@Autowired TutorialRepository tutorialRepository;
	@Autowired OTPRepo otpRepo;
	@Autowired QuestionRepo questionRepo;
	@Autowired PostRepo postRepo;
	
    
	@RequestMapping("/index")
	public String index()
	{
		return "index";
	}
	@RequestMapping("/login")
	public String login()
	{
		return "login";
	}
	
	@PostMapping("/loginAction")
	public ModelAndView loginAction(@RequestParam(name="email")String email,@RequestParam(name="password")String password,HttpSession session)
	{
	    System.out.println(email+"   "+password);	
		ModelAndView model=new ModelAndView();
		User user = userRepository.findByEmail(email);
		if(email.equals(user.getEmail())&&password.equals(user.getPassword())&&"enable".equals(user.getStatus()))
		{
			session.setAttribute("user", user);
			model.addObject("user",user);
			if(user.getRole().equals("user"))
			model.setViewName("welcome");
			else if(user.getRole().equals("admin"))
				model.setViewName("adminwelcome");
			else if(user.getRole().equals("debugger"))
				model.setViewName("debuggerwelcome");
		}
		else if("disable".equals(user.getStatus()))
		{
			model.setViewName("login");
			model.addObject("msg","User is disabled");
			
		}
		else
		{
			model.setViewName("login");
			model.addObject("msg","Invalid Creds");
		}
		return model;
	}
	
	@PostMapping("/UpdateAccount")
	public String updateAccount(HttpSession session,@RequestParam(name="mob")String mob,@RequestParam(name="email")String email,@RequestParam(name="name")String name,@RequestParam(name="password")String password)
	{
		
		User userdb = userRepository.findByEmail(email);
		ModelAndView model=new ModelAndView();
		if(userdb!=null)
		{
			User user=new User();
			user.setId(userdb.getId());
			user.setEmail(email);
			user.setName(name);
			user.setMob(mob);
		
			user.setRole(userdb.getRole());
			user.setPassword(password);
			user.setStatus(userdb.getStatus());
			userRepository.save(user);
			model.addObject("msg","Record Updated Successfully");
			model.addObject("user",user);
			model.setViewName("welcome");
			
			
		}
		else
		{
			model.addObject("msg","User Does not Exist");
			model.setViewName("welcome");
		}
		
		return "redirect:/isucode/getAccount"; 
		
	}
	@GetMapping("/logout") 
	public ModelAndView logout(HttpServletRequest request)
	{
		ModelAndView model=new ModelAndView();
		 HttpSession session = request.getSession(); 
		 session.invalidate(); 
		 model.addObject("msg","Logout Successfully");
		 model.setViewName("login");
		 return model; 
		 } 
	
	
	@GetMapping("/createAccount")
	public ModelAndView createAccount()
	{
		ModelAndView model=new ModelAndView();
		model.setViewName("createAccount");
		return model;
	}
	@PostMapping("/createAccountAction")
	public ModelAndView createAccountAction(HttpSession session,@RequestParam(name="mob")String mob,@RequestParam(name="email")String email,@RequestParam(name="name")String name,@RequestParam(name="password1")String pass,@RequestParam(name="password2")String confirmpass)
	{
		ModelAndView model=new ModelAndView();
		if(pass.equals(confirmpass))
		{
		User user=new User();
		user.setMob(mob);
		user.setName(name);
		user.setEmail(email);
		user.setPassword(pass);
		user.setRole("user");
		user.setStatus("enable");
		userRepository.save(user);
		model.addObject("msg","User Created Successfull!. Plz login");
		model.setViewName("index");
		}
		else
		{
			model.addObject("msg","Password does not match");
			model.setViewName("createAccount");
		}
		return model;
	}

	
	@GetMapping("/addTutorial")
	public ModelAndView addTutorial()
	{
		ModelAndView model=new ModelAndView();
		model.setViewName("addTutorial");
		return model;
	}
	@PostMapping("/saveTutorial")
	public String saveTutorial(Model model,HttpServletRequest request)
	{
		String tutorialName=request.getParameter("tutorialName");
		String[] tutorialTitle = request.getParameterValues("tutorialTitle");
		String[] tutorialDesc = request.getParameterValues("tutorialDesc");
		Tutorial tutorial=new Tutorial();
		//List<String> finaltutorialTitle = Arrays.asList(tutorialTitle);
		//List<String> finaltutorialDesc= Arrays.asList(tutorialDesc);
		tutorial.setTname(tutorialName);
		tutorial.setTitle(tutorialTitle);
		tutorial.setTdesc(tutorialDesc);
		tutorialRepository.save(tutorial);
		model.addAttribute("msg","Tutorial Added Successfully!!");
		return "redirect:/isucode/viewTutorial"; 
	}
	
	@GetMapping("/viewTutorial")
	public ModelAndView viewTutorial()
	{
		ModelAndView model=new ModelAndView();
		List<Tutorial> tutorials=(List<Tutorial>) tutorialRepository.findAll();
		String[] res=null;
		for(Tutorial t:tutorials)
		{
		
			res=t.getTdesc();
			/*
			 * for(int i=0;i<res.length;i++) System.out.println(res[i]+";;;;;;;;;;;;;;;");
			 */
		}
		model.addObject("tutorials",tutorials);
		model.setViewName("viewTutorial");
		return model;
	}
	
	@GetMapping("/deleteTutorial/{tid}")
	public ModelAndView viewTutorial(@PathVariable("tid")int tid)
	{
		tutorialRepository.deleteById(tid);
		ModelAndView model=new ModelAndView();
		model.addObject("msg","Tutorial Deleted Successfully");
		List<Tutorial> tutorials=(List<Tutorial>) tutorialRepository.findAll();
		model.addObject("tutorials",tutorials);
		model.setViewName("viewTutorial");
		return model;
	}
	@GetMapping("/updateTutorial/{tid}")
	public ModelAndView updateTutorial(@PathVariable("tid")int tid)
	{
	
		ModelAndView model=new ModelAndView();
		Tutorial tut=null;
		Optional<Tutorial> tutorial= tutorialRepository.findById(tid);
		if(tutorial.isPresent())
		{
			tut=tutorial.get();
		}
		model.addObject("tutorial",tut);
		model.setViewName("updateTutorial");
		return model;
	}
	@PostMapping("/updateTutorialAction")
	public String updateTutorialAction(Model model,@RequestParam(name="tid")int tid,HttpServletRequest request)
	{
		/*
		 * Tutorial tutorial=new Tutorial(); tutorial.setTid(tid);
		 * tutorial.setTname(tutorialName); tutorial.setTitle(tutorialTitle);
		 * tutorial.setTdesc(tutorialDesc); tutorialRepository.save(tutorial);
		 */
		
		
		
		String tutorialName=request.getParameter("tutorialName");
		String[] tutorialTitle = request.getParameterValues("tutorialTitle");
		String[] tutorialDesc = request.getParameterValues("tutorialDesc");
		Tutorial tutorial=new Tutorial();
		//List<String> finaltutorialTitle = Arrays.asList(tutorialTitle);
		//List<String> finaltutorialDesc= Arrays.asList(tutorialDesc);
		tutorial.setTid(tid);
		tutorial.setTname(tutorialName);
		tutorial.setTitle(tutorialTitle);
		tutorial.setTdesc(tutorialDesc);
		tutorialRepository.save(tutorial);
		model.addAttribute("msg","Tutorial Added Successfully!!");
		return "redirect:/isucode/viewTutorial"; 
		
	}
	
	@GetMapping("/getTutorials")
	public ModelAndView getTutorials()
	{
		ModelAndView model=new ModelAndView();
		List<Tutorial> tutorials=(List<Tutorial>) tutorialRepository.findAll();
		System.out.println(tutorials);
		model.addObject("tutorials",tutorials);
		model.setViewName("tutorial");
		return model;
	}
	@GetMapping("/viewUsers")
	public ModelAndView viewUsers()
	{
		ModelAndView model=new ModelAndView();
		List<User> users=(List<User>) userRepository.findAll();
		model.addObject("users",users);
		model.setViewName("viewUsers");
		return model;
	}
	
	@GetMapping("/deactivateUser/{id}")
	public String deactivateUser(@PathVariable("id") int id,Model model)
	{
		userRepository.changeUserStatus(id, "disable");
		
		model.addAttribute("msg","User Deactivated Successfully");
		return "redirect:/isucode/viewUsers";
	}
	@GetMapping("/activateUser/{id}")
	public String activateUser(@PathVariable("id") int id,Model model)
	{
		userRepository.changeUserStatus(id, "enable");
		
		model.addAttribute("msg","User Activated Successfully");
		return "redirect:/isucode/viewUsers";
	}
	
	@GetMapping("/forgotPassword")
	public ModelAndView forgotPassword()
	{
		ModelAndView model=new ModelAndView();
		model.setViewName("forgotPassword");
		return model;
	}
	@PostMapping("/forgotPasswordAction/{email}")
	public @ResponseBody String forgotPasswordAction(@PathVariable("email")String email) throws JsonProcessingException
	{   String res=null;
	String msg=null;
	     User user = userRepository.findByEmail(email);
		ObjectMapper mapper = new ObjectMapper();
		if(user!=null)
		{
			long otp = (long) Math.floor(Math.random() * 900000L) + 10000L;
			msg="OTP sent to "+user.getEmail();
			Mailer mailer=new Mailer();
			String sub="OTP for Change Password";
			String message="Your OTP is " +String.valueOf(otp);
			OTPTable otpTable=new OTPTable();
			otpTable.setOtp(String.valueOf(otp));
			otpTable.setEmail(email);
			otpRepo.save(otpTable);
			mailer.send("projects22426@gmail.com", "Redbird!", user.getEmail(), sub, message);
		}
		else
		{
			msg=email+" Does not exist";
		}
		res = mapper.writeValueAsString(msg);
		return res;
	}
		@PostMapping("/changePassword/{email}/{otp}/{newPassword}/{confirmPassword}")
		public @ResponseBody String changePassword(@PathVariable("email")String email,@PathVariable("otp")String otp,@PathVariable("newPassword")String newPassword,@PathVariable("confirmPassword")String confirmPassword) throws JsonProcessingException
		{   String res=null;
		String msg=null;
		OTPTable otpDb1=null;
		int maxid = otpRepo.getMaxTransactionId(email);
		Optional<OTPTable> otpDb = otpRepo.findById(maxid);
		if(otpDb.isPresent())
		{
			otpDb1=otpDb.get();	
		}
		if(otp.equals(otpDb1.getOtp()))
		{
			if(newPassword.equals(confirmPassword))
			{   userRepository.changeUserPassword(email, newPassword);
				msg="Password Change Succcessfully!. Plz login";
			}
			else
			{
				msg="New Password and Confirm Password Does not match";
			}
		}
		else
		{
			msg="Please Enter Correct OTP";
		}
			ObjectMapper mapper = new ObjectMapper(); 	
		res = mapper.writeValueAsString(msg);
		return res;
	}
		
		@GetMapping("/viewParticularTopic/{tid}")
		public ModelAndView viewParticularTopic(@PathVariable("tid") int tid)
		{     Tutorial totorial=null;
			ModelAndView model=new ModelAndView();
			Optional<Tutorial> totorial1= tutorialRepository.findById(tid);
			if(totorial1.isPresent())
				totorial=totorial1.get();
			List<Tutorial> tutorials=(List<Tutorial>) tutorialRepository.findAll();
			model.addObject("totorial",totorial);
			model.addObject("tutorials",tutorials);
			model.setViewName("viewParticularTopic");
			return model;
		}
		@GetMapping("/searchTutorial/{TutorialSearch}")
		public @ResponseBody String searchTutorial(@PathVariable("TutorialSearch") String tutorialSearch) throws JsonProcessingException
		{ /*
			 * Tutorial totorial=null; ModelAndView model=new ModelAndView();
			 * Optional<Tutorial> totorial1= tutorialRepository.findById(tid);
			 * if(totorial1.isPresent()) totorial=totorial1.get(); List<Tutorial>
			 * tutorials=(List<Tutorial>) tutorialRepository.findAll();
			 * model.addObject("totorial",totorial); model.addObject("tutorials",tutorials);
			 * model.setViewName("viewParticularTopic"); return model;
			 */
			System.out.println("???????????????????????????????????????????????");
			String res=null;
			List<Tutorial> list = (List<Tutorial>) tutorialRepository.findAll();
			List<DTOTitleDesc> finallist=new ArrayList<>();
			for(Tutorial t:list)
			{   
				String[] title=t.getTitle();
				String[] desc=t.getTdesc();
				for(int i=0;i<title.length;i++)
				{
					if(title[i].toLowerCase().indexOf(tutorialSearch.toLowerCase())>=0)
					{
						DTOTitleDesc dto=new DTOTitleDesc();
						dto.setTitle(title[i]);
						dto.setDesc(desc[i]);
						dto.setId(i);
						finallist.add(dto);
						System.out.println(title[i]+"   <<<<<<<<<<<<<<<<<<<<<<<<<<<");
					}
						
				
				}
			}
			int a=0;
			ModelAndView model=new ModelAndView();
			model.setViewName("viewParticularTopic");
			
			ObjectMapper mapper = new ObjectMapper(); 	
			res = mapper.writeValueAsString(finallist);
			return res;
			
		}
		
		
		
		@GetMapping("/makeDebugger/{id}")
		public String makeDebugger(@PathVariable("id") int id,Model model)
		{
			userRepository.changeUserRole(id, "debugger");
			
			model.addAttribute("msg","User Deactivated Successfully");
			return "redirect:/isucode/viewUsers";
		}
		
		@GetMapping("/getDebugger")
		public ModelAndView getDebugger(HttpSession session)
		{
			
			User user = (User)session.getAttribute("user");
			List<Questions> ques = questionRepo.findByEmail(user.getEmail());
			Collections.sort(ques,Collections.reverseOrder());
			ModelAndView model=new ModelAndView();
			model.addObject("user",user);
			model.addObject("ques",ques);
			model.setViewName("getDebugger");
			return model;
		}
		@PostMapping("/saveQuestion")
		public String saveQuestion(HttpSession session,@RequestParam(name="question")String question)
		{
			
			User user = (User)session.getAttribute("user");
			
			
			Questions que=new Questions();
			que.setQuestion(question);
			que.setUserEmail(user.getEmail());
			questionRepo.save(que);
			List<Questions> ques = questionRepo.findByEmail(user.getEmail());
			ModelAndView model=new ModelAndView();
			model.addObject("user",user);
			model.addObject("ques",ques);
			model.setViewName("getDebugger");
			model.addObject("msg","Question Added Successfully");
			return "redirect:/isucode/getDebugger"; 
		}
		
		@GetMapping("/getHelpful/{qid}")
		public String getHelpful(@PathVariable("qid") int qid,Model model)
		{   int count=0;
			Questions question=null;
			Optional<Questions> question1 = questionRepo.findById(qid);
			if(question1.isPresent())
				question=question1.get();
			if(question.getHelpful()!=null)
		    count=Integer.parseInt(question.getHelpful())+1;
			else
				count=1;	
			questionRepo.changeHelpful(""+count, qid);
			return "redirect:/isucode/getDebugger";
		}
		@GetMapping("/getUnhelpful/{qid}")
		public String getUnHelpful(@PathVariable("qid") int qid,Model model)
		{   int count=0;
			Questions question=null;
			Optional<Questions> question1 = questionRepo.findById(qid);
			if(question1.isPresent())
				question=question1.get();
			if(question.getUnhelpful()!=null)
		    count=Integer.parseInt(question.getUnhelpful())+1;
			else
				count=1;	
			questionRepo.changeUnHelpful(""+count, qid);
			return "redirect:/isucode/getDebugger";
		}
		
		@PostMapping("/savePost")
		public String savePost(HttpSession session,@RequestParam(name="post")String post,@RequestParam(name="qid")int qid)
		{   Questions question=null;

			User user = (User)session.getAttribute("user");
			Optional<Questions> question1 = questionRepo.findById(qid);
			if(question1.isPresent())
				question=question1.get();
			Post pst=new Post();
			pst.setPost(post);
			pst.setQuestioin(question);
			postRepo.save(pst);
			List<Questions> ques = questionRepo.findByEmail(user.getEmail());
			ModelAndView model=new ModelAndView();
			model.addObject("user",user);
			model.addObject("ques",ques);
			model.setViewName("getDebugger");
			model.addObject("msg","Question Added Successfully");
			return "redirect:/isucode/getDebugger"; 
		}
		
		@GetMapping("/deletePost/{pid}")
		public String getUnHelpful(@PathVariable("pid") int pid)
		{
			postRepo.deleteById(pid);
			return "redirect:/isucode/getDebugger"; 
		}
		
		@GetMapping("/viewQuestion")
		public ModelAndView viewQuestion()
		{   ModelAndView model=new ModelAndView();
		    List<Questions> questioins = (List<Questions>) questionRepo.findAll();
			model.addObject("questioins",questioins);
			model.setViewName("viewQuestion");
			return model;
		}
		
		@GetMapping("/viewParticularQuestion/{qid}")
		public ModelAndView viewParticularQuestion(@PathVariable("qid") int qid)
		{  
			Questions question=null;
			Optional<Questions> que = questionRepo.findById(qid);
			if(que.isPresent())
				question=que.get();
			ModelAndView model=new ModelAndView();
			model.addObject("ques",question);
			model.setViewName("viewParticularQuestion");
			return model;
		}
		
		@PostMapping("/addOrUpdateAnswer")
		public String addOrUpdateAnswer(HttpSession session,@RequestParam(name="answer")String answer,@RequestParam(name="qid")int qid)
		{
			questionRepo.saveOrUpdateAnswer(answer, qid);
			return "redirect:/isucode/viewQuestion";
		}
		
		@GetMapping("/loginasuser")
		public ModelAndView loginasuser(HttpSession session)
		{
			User user = (User) session.getAttribute("user");
			ModelAndView model=new ModelAndView();
			model.addObject("user",user);
			model.setViewName("welcome");
			return model;
		}
		
		@GetMapping("/getAccount")
		public ModelAndView getAccount(HttpSession session)
		{
			User u1=(User) session.getAttribute("user");
			User user = userRepository.findByEmail(u1.getEmail());
			ModelAndView model=new ModelAndView();
			model.addObject("user",user);
			model.setViewName("account");
			return model;
			
		}
		@GetMapping("/updateDetails/{id}")
		public ModelAndView updateDetails(@PathVariable("id")int id)
		{ User user=null;
			Optional<User> user1 = userRepository.findById(id);
			if(user1.isPresent())
				user=user1.get();
			ModelAndView model=new ModelAndView();
			model.addObject("user",user);
			model.setViewName("updateDetails");
			return model;

			
		}
		@GetMapping("adminPage")
		public ModelAndView adminPage()
		{
			return new ModelAndView("adminPage");
		}
		
		@GetMapping("debuggerPage")
		public ModelAndView debuggerPage()
		{
			return new ModelAndView("debuggerPage");
		}
		@GetMapping("AboutUs")
		public ModelAndView AboutUs()
		{
			return new ModelAndView("AboutUs");
		}
		@GetMapping("ContactUs")
		public ModelAndView ContactUs()
		{
			return new ModelAndView("ContactUs");
		}
		

		

}
		
		

