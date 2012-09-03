namespace :load_voter_registration do
  desc "Load state guidelines"
  task :guidelines, [:file, :locale] => :environment do |t, args|
    Guidelines.destroy_all
    args.with_defaults(:file => "state_info_en.yml", :locale => "en")

    a = YAML::load(File.open(File.join(VoterRegistration::Engine.root, "data", args.file)))
    a["children"].each do |state|
      @info = Guidelines.new
      @info.locale = args.locale
      @info.state = state["slug"]
      @info.name = state["title"]
      state["children"].each do |info|
        if info["slug"] == "registration_requirements"
          @info.requirements = info["body"]
        elsif info["slug"] == "felony_info"
          @info.felony = info["body"]
        elsif info["slug"] == "student_info"
          @info.student = info["body"]
        elsif info["slug"] == "deadline_info"
          @info.deadline = info["body"]
        elsif info["slug"] == "id_info"
          @info.identification = info["body"]
        elsif info["slug"] == "same_day_registration_info"
          @info.same_day = info["body"]
        elsif info["slug"] == "early_voting_info"
          @info.early_voting = info["body"]
        elsif info["slug"] == "url"
          @info.url = info["body"]
        elsif info["slug"] == "online"
          @info.online = info["body"]
        elsif info["slug"] == "online_requirements"
          @info.online_requirements = info["body"]
        elsif info["slug"] == "online_url"
          @info.online_url = info["body"]
        end
      end
      @info.save
    end
    puts "#{Guidelines.count} states loaded "
    
    #Load the Secretary of State mailing address
    Guidelines.find_by_state("AK").update_attributes({:mail_to_address_4=>"Juneau, AK 99811-0017", :mail_to_address_1=>"Division of Elections", :mail_to_address_2=>"State of Alaska", :mail_to_address_3=>"PO Box 110017"})
    Guidelines.find_by_state("AL").update_attributes({:mail_to_address_4=>"Montgomery, AL 36103-5616", :mail_to_address_1=>"Office of the Secretary of State", :mail_to_address_2=>"P.O. Box 5616", :mail_to_address_3=>""})
    Guidelines.find_by_state("AR").update_attributes({:mail_to_address_4=>"Little Rock, AR 72203-8111", :mail_to_address_1=>"Secretary of State", :mail_to_address_2=>"Voter Services", :mail_to_address_3=>"P.O. Box 8111"})
    Guidelines.find_by_state("AZ").update_attributes({:mail_to_address_4=>"Phoenix, AZ 85007-2888", :mail_to_address_1=>"Secretary of State/Elections", :mail_to_address_2=>"1700 W. Washington, 7th Floor", :mail_to_address_3=>""})
    Guidelines.find_by_state("CA").update_attributes({:mail_to_address_4=>"Sacramento, CA 95814", :mail_to_address_1=>"Secretary of State", :mail_to_address_2=>"Elections Division", :mail_to_address_3=>"1500 11th Street"})
    Guidelines.find_by_state("CO").update_attributes({:mail_to_address_4=>"Denver, CO 80290", :mail_to_address_1=>"Colorado Secretary of State", :mail_to_address_2=>"1700 Broadway, Suite 270", :mail_to_address_3=>""})
    Guidelines.find_by_state("CT").update_attributes({:mail_to_address_4=>"Hartford, CT 06106", :mail_to_address_1=>"Secretary of State", :mail_to_address_2=>"Elections Division", :mail_to_address_3=>"30 Trinity Street"})
    Guidelines.find_by_state("DC").update_attributes({:mail_to_address_4=>"Washington, DC 20001-2745", :mail_to_address_1=>"District of Columbia Board of Elections & Ethics", :mail_to_address_2=>"441 4th Street NW, Suite 250", :mail_to_address_3=>""})
    Guidelines.find_by_state("DE").update_attributes({:mail_to_address_4=>"Dover, DE 19904", :mail_to_address_1=>"Commissioner of Elections", :mail_to_address_2=>"111 S. West St., Suite 10", :mail_to_address_3=>""})
    Guidelines.find_by_state("FL").update_attributes({:mail_to_address_4=>"Tallahassee, FL 32399-0250", :mail_to_address_1=>"Department of State, Division of Elections, Bureau of Voter Registration Services", :mail_to_address_2=>"Room 316, R.A. Gray Building", :mail_to_address_3=>"500 South Bronough St"})
    Guidelines.find_by_state("GA").update_attributes({:mail_to_address_4=>"Atlanta, GA 30334-1505", :mail_to_address_1=>"Elections Division, Office of the Secretary of State", :mail_to_address_2=>"1104 West Tower", :mail_to_address_3=>"2 Martin Luther King, Jr. Dr. SE"})
    Guidelines.find_by_state("HI").update_attributes({:mail_to_address_4=>"Pearl City, HI 96782", :mail_to_address_1=>"Office of Elections", :mail_to_address_2=>"State of Hawaii", :mail_to_address_3=>"802 Lehua Avenue"})
    Guidelines.find_by_state("IA").update_attributes({:mail_to_address_4=>"Des Moines, IA 50319", :mail_to_address_1=>"Elections Division, Office of the Secretary of State", :mail_to_address_2=>"Lucas Building-1st Floor", :mail_to_address_3=>"321 E. 12th Street"})
    Guidelines.find_by_state("ID").update_attributes({:mail_to_address_4=>"Boise, ID 83720-0080", :mail_to_address_1=>"Secretary of State", :mail_to_address_2=>"P.O. Box 83720", :mail_to_address_3=>"State Capitol Bldg."})
    Guidelines.find_by_state("IL").update_attributes({:mail_to_address_4=>"Springfield, IL 62704", :mail_to_address_1=>"State Board of Elections", :mail_to_address_2=>"1020 S. Spring Street", :mail_to_address_3=>""})
    Guidelines.find_by_state("IN").update_attributes({:mail_to_address_4=>"Indianapolis, IN 46204-2743", :mail_to_address_1=>"Election Division", :mail_to_address_2=>"Office of the Secretary of State", :mail_to_address_3=>"302 West Washington Street, Room E-204"})
    Guidelines.find_by_state("KS").update_attributes({:mail_to_address_4=>"Topeka, KS 66612-1594", :mail_to_address_1=>"Secretary of State", :mail_to_address_2=>"1st Floor, Memorial Hall", :mail_to_address_3=>"120 SW 10th Ave."})
    Guidelines.find_by_state("KY").update_attributes({:mail_to_address_4=>"Frankfort, KY 40601-3240", :mail_to_address_1=>"State Board of Elections", :mail_to_address_2=>"140 Walnut Street", :mail_to_address_3=>""})
    Guidelines.find_by_state("LA").update_attributes({:mail_to_address_4=>"Baton Rouge, LA 70804-9125", :mail_to_address_1=>"Secretary of State", :mail_to_address_2=>"Attention: Voter Registration", :mail_to_address_3=>"P.O. Box 94125"})
    Guidelines.find_by_state("MA").update_attributes({:mail_to_address_4=>"Boston, MA 02108", :mail_to_address_1=>"Secretary of the Commonwealth Elections Division", :mail_to_address_2=>"Room 1705", :mail_to_address_3=>"One Ashburton Place"})
    Guidelines.find_by_state("MD").update_attributes({:mail_to_address_4=>"Annapolis, MD 21401-0486", :mail_to_address_1=>"State Board of Elections", :mail_to_address_2=>"P.O. Box 6486", :mail_to_address_3=>""})
    Guidelines.find_by_state("ME").update_attributes({:mail_to_address_4=>"Augusta, ME 04333-0101", :mail_to_address_1=>"Elections Division Bureau of Corporations, Elections and Commissions", :mail_to_address_2=>"101 State House Station", :mail_to_address_3=>""})
    Guidelines.find_by_state("MI").update_attributes({:mail_to_address_4=>"Lansing, MI 48901-0726", :mail_to_address_1=>"Michigan Department of State", :mail_to_address_2=>"Bureau of Elections", :mail_to_address_3=>"P.O. Box 20126"})
    Guidelines.find_by_state("MN").update_attributes({:mail_to_address_4=>"St. Paul, MN 55103-1855", :mail_to_address_1=>"Secretary of State", :mail_to_address_2=>"60 Empire Drive", :mail_to_address_3=>"Suite 100"})
    Guidelines.find_by_state("MO").update_attributes({:mail_to_address_4=>"Jefferson City, MO 65102-1767", :mail_to_address_1=>"Secretary of State", :mail_to_address_2=>"P.O. Box 1767", :mail_to_address_3=>""})
    Guidelines.find_by_state("MS").update_attributes({:mail_to_address_4=>"Jackson, MS 39205-0136", :mail_to_address_1=>"Secretary of State", :mail_to_address_2=>"P.O. Box 136", :mail_to_address_3=>""})
    Guidelines.find_by_state("MT").update_attributes({:mail_to_address_4=>"Helena, MT 59620-2801", :mail_to_address_1=>"Secretary of State's Office", :mail_to_address_2=>"P.O. Box 202801", :mail_to_address_3=>"State Capitol"})
    Guidelines.find_by_state("NC").update_attributes({:mail_to_address_4=>"Raleigh, NC 27611-7255", :mail_to_address_1=>"State Board of Elections", :mail_to_address_2=>"P.O. Box 27255", :mail_to_address_3=>""})
    Guidelines.find_by_state("NE").update_attributes({:mail_to_address_4=>"Lincoln, NE 68509-4608", :mail_to_address_1=>"Nebraska Secretary of State", :mail_to_address_2=>"Suite 2300", :mail_to_address_3=>"State Capitol Building"})
    Guidelines.find_by_state("NJ").update_attributes({:mail_to_address_4=>"Trenton, NJ 08625-0304", :mail_to_address_1=>"New Jersey Department of Law and Public Safety", :mail_to_address_2=>"Division of Elections", :mail_to_address_3=>"P.O. Box 304"})
    Guidelines.find_by_state("NM").update_attributes({:mail_to_address_4=>"Santa Fe, NM 87503", :mail_to_address_1=>"Bureau of Elections", :mail_to_address_2=>"325 Don Gaspar", :mail_to_address_3=>"Suite 300"})
    Guidelines.find_by_state("NV").update_attributes({:mail_to_address_4=>"Carson City, NV 89701-4786", :mail_to_address_1=>"Secretary of State - Elections Division", :mail_to_address_2=>"101 North Carson Street", :mail_to_address_3=>"Suite 3"})
    Guidelines.find_by_state("NY").update_attributes({:mail_to_address_4=>"Albany, NY 12207-2108", :mail_to_address_1=>"NYS Board of Elections", :mail_to_address_2=>"40 Steuben Street", :mail_to_address_3=>""})
    Guidelines.find_by_state("OH").update_attributes({:mail_to_address_4=>"Columbus, OH 43215", :mail_to_address_1=>"Secretary of State of Ohio Elections Division", :mail_to_address_2=>"180 E. Broad Street", :mail_to_address_3=>"15th Floor"})
    Guidelines.find_by_state("OK").update_attributes({:mail_to_address_4=>"Oklahoma City, OK 73152-8800", :mail_to_address_1=>"Oklahoma State Election Board", :mail_to_address_2=>"Box 528800", :mail_to_address_3=>""})
    Guidelines.find_by_state("OR").update_attributes({:mail_to_address_4=>"Salem, OR 97310-0722", :mail_to_address_1=>"Secretary of State", :mail_to_address_2=>"Elections Divison", :mail_to_address_3=>"141 State Capitol"})
    Guidelines.find_by_state("PA").update_attributes({:mail_to_address_4=>"Harrisburg, PA 17120-0029", :mail_to_address_1=>"Office of the Secretary of the Commonwealth", :mail_to_address_2=>"210 North Office Bldg.", :mail_to_address_3=>""})
    Guidelines.find_by_state("RI").update_attributes({:mail_to_address_4=>"Providence, RI 02904-2790", :mail_to_address_1=>"Rhode Island State Board of Elections", :mail_to_address_2=>"50 Branch Ave.", :mail_to_address_3=>""})
    Guidelines.find_by_state("SC").update_attributes({:mail_to_address_4=>"Columbia, SC 29250-5987", :mail_to_address_1=>"State Election Commission", :mail_to_address_2=>"P.O. Box 5987", :mail_to_address_3=>""})
    Guidelines.find_by_state("SD").update_attributes({:mail_to_address_4=>"Pierre, SD 57501-5070", :mail_to_address_1=>"Elections, Secretary of State", :mail_to_address_2=>"500 E. Capitol", :mail_to_address_3=>""})
    Guidelines.find_by_state("TN").update_attributes({:mail_to_address_4=>"Nashville, TN 37243", :mail_to_address_1=>"Coordinator of Elections", :mail_to_address_2=>"Tennessee Tower, Ninth Floor", :mail_to_address_3=>"312 Eighth Avenue, North"})
    Guidelines.find_by_state("TX").update_attributes({:mail_to_address_4=>"Austin, TX 78711-2060", :mail_to_address_1=>"Office of the Secretary of State", :mail_to_address_2=>"Elections Division", :mail_to_address_3=>"P.O. Box 12060"})
    Guidelines.find_by_state("UT").update_attributes({:mail_to_address_4=>"Salt Lake City, UT 84114", :mail_to_address_1=>"Office of the Lieutenant Governor", :mail_to_address_2=>"P.O. Box 142325", :mail_to_address_3=>""})
    Guidelines.find_by_state("VA").update_attributes({:mail_to_address_4=>"Richmond, VA 23219", :mail_to_address_1=>"State Board of Elections", :mail_to_address_2=>"Washington Building", :mail_to_address_3=>"1100 Bank Street"})
    Guidelines.find_by_state("VT").update_attributes({:mail_to_address_4=>"Montpelier, VT 05609-1101", :mail_to_address_1=>"Office of the Secretary of State", :mail_to_address_2=>"Director of Elections", :mail_to_address_3=>"26 Terrace Street"})
    Guidelines.find_by_state("WA").update_attributes({:mail_to_address_4=>"Olympia, WA 98504-0230", :mail_to_address_1=>"Secretary of State", :mail_to_address_2=>"Voter Registration by Mail", :mail_to_address_3=>"P.O. Box 40230"})
    Guidelines.find_by_state("WI").update_attributes({:mail_to_address_4=>"Madison, WI 53701-2973", :mail_to_address_1=>"State Elections Board", :mail_to_address_2=>"17 West Main Street, Suite 310", :mail_to_address_3=>"P.O. Box 2973"})
    Guidelines.find_by_state("WV").update_attributes({:mail_to_address_4=>"Charleston, WV 25305-0770", :mail_to_address_1=>"Secretary of State", :mail_to_address_2=>"Building 1, Suite 157-K", :mail_to_address_3=>"1900 Kanawha Blvd. East"})
    puts "Secretary of State data loaded"

    Guidelines.find_by_state("WY").update_attributes({:supported => false, :unsupported => "<p>Wyoming has it own voter registration form, which can access through <a href=\"http://soswy.state.wy.us/Elections/RegisteringToVote.aspx\">the Wyoming Secretary of State site</a>.</p><p>But you should still check out the important deadlines and guidelines in Wyoming.</p>"})
    Guidelines.find_by_state("ND").update_attributes({:supported => false, :unsupported => "<p>In North Dakota, you don't have to register in order to vote. But you should still check out the voting guidelines and important deadlines to make sure you're prepared to cast a ballot in North Dakota.</p>"})
    Guidelines.find_by_state("NH").update_attributes({:supported => false, :unsupported => "<p>To register to vote in New Hampshire, you must contact your town clerk and request a voter registration form. <a href=\"http://cfs.sos.nh.gov/app/Public/ClerkDetails.aspx\">Find your town clerk here.</a></p>"})
    puts "Set ND,NH,WY to unsupported states"
  end

  desc "Load state instructions"
  task :instructions => :environment do
    Instructions.destroy_all
    a = YAML::load(File.open(File.join(VoterRegistration::Engine.root, "data", "instructions.yml")))
    a['state'].each do |state|
      Instructions.create(state)
    end
    puts "#{Instructions.count} state instructions loaded"
  end

  desc "Load state deadlines"
  task :deadlines => :environment do
    a = JSON.load(File.read(File.join(VoterRegistration::Engine.root, "data", "state_deadlines.en.json")))
    count = 0
    a.each do |state|
      @guidelines = Guidelines.find_by_state(state[0])
      @guidelines.update_attributes(:deadline => state[1])
      if @guidelines.save
        count = count+1
      end
    end
    puts "#{count} state deadlines loaded"
  end
  
  
  desc "Load political parties"
  task :political_parties => :environment do
    PoliticalParty.destroy_all
    PoliticalParty.create(:name => "Democratic")
    PoliticalParty.create(:name => "Libertarian")
    PoliticalParty.create(:name => "Republican")
    PoliticalParty.create(:name =>  "Unaffiliated")
    PoliticalParty.create(:name => "Other")
    puts "Added pollitical parties"
  end

  desc "Load ethnicities"
  task :ethnicities => :environment do
    Ethnicity.destroy_all
    Ethnicity.create(:name => "American Indian or Alaskan Native")
    Ethnicity.create(:name => "Asian or Pacific Islander")
    Ethnicity.create(:name => "Black, not of Hispanic Origin")
    Ethnicity.create(:name => "Hispanic")
    Ethnicity.create({:name => "Multi-racial"})
    Ethnicity.create(:name => "White, not of Hispanic Origin")
    Ethnicity.create(:name => "Other")
    puts "Added ethnicity fields"
  end

  desc "Load all state information (:guidelines, :instructions, :deadlines)"
  task :all => [:guidelines, :instructions, :deadlines, :political_parties, :ethnicities]
end
