// Quiz questions for all 6 categories with 3 levels (8 questions per level)
// Level 1: Beginner concepts
// Level 2: Intermediate understanding
// Level 3: Advanced critical thinking

class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctIndex;
  final String explanation;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.explanation,
  });
}

class AllQuizzes {
  // CATEGORY 1: FASHION & FAST FASHION
  static List<QuizQuestion> fashionLevel1 = [
    QuizQuestion(
      question: "What does \"fast fashion\" mean?",
      options: ["Clothing made slowly and carefully", "Cheap clothes made quickly to follow trends", "Handmade luxury clothing", "Clothing designed to last 10+ years"],
      correctIndex: 1,
      explanation: "Fast fashion = fast production, low quality, disposable trends.",
    ),
    QuizQuestion(
      question: "Which material is most commonly used in fast fashion?",
      options: ["Polyester", "Silk", "Linen", "Wool"],
      correctIndex: 0,
      explanation: "Polyester is cheap and easy to mass-produce, which is why fast fashion brands rely on it.",
    ),
    QuizQuestion(
      question: "True or False: Fast fashion is designed to be long-lasting.",
      options: ["True", "False"],
      correctIndex: 1,
      explanation: "It is intentionally low-quality so people buy more often.",
    ),
    QuizQuestion(
      question: "What is \"overconsumption\"?",
      options: ["Wearing the same clothes too often", "Buying more clothes than you need", "Donating too many clothes", "Only buying second-hand"],
      correctIndex: 1,
      explanation: "Overconsumption = unnecessary purchasing leading to more waste.",
    ),
    QuizQuestion(
      question: "Which option is more sustainable?",
      options: ["Buying 3 cheap shirts", "Buying 1 high-quality shirt", "Buying clothes every week", "Throwing clothes away after one use"],
      correctIndex: 1,
      explanation: "Durable clothing reduces replacement frequency and waste.",
    ),
    QuizQuestion(
      question: "What is a \"microtrend\"?",
      options: ["A long-lasting fashion movement", "A trend that lasts only a few days or weeks", "A trend created by luxury brands", "A trend based on fabric thickness"],
      correctIndex: 1,
      explanation: "Microtrends burn out fast, leading to more waste.",
    ),
    QuizQuestion(
      question: "Which of these is a sign of fast fashion?",
      options: ["High transparency reports", "Weekly new collections", "Long-lasting durable fabrics", "Repair services"],
      correctIndex: 1,
      explanation: "Constant new drops encourage constant buying.",
    ),
    QuizQuestion(
      question: "What is the \"real cost\" of a cheap shirt?",
      options: ["Only the money you pay", "Money + environmental + social impact", "Only shipping costs", "None"],
      correctIndex: 1,
      explanation: "The price tag hides pollution and worker exploitation.",
    ),
  ];

  static List<QuizQuestion> fashionLevel2 = [
    QuizQuestion(
      question: "What is the main driver of fast fashion pollution?",
      options: ["High prices", "Slow production", "High-volume manufacturing", "Limited clothing drops"],
      correctIndex: 2,
      explanation: "Fast fashion produces too much, too fast.",
    ),
    QuizQuestion(
      question: "What makes polyester harmful?",
      options: ["It is fully biodegradable", "It sheds microplastics", "It is made from plants", "It lasts for only one wash"],
      correctIndex: 1,
      explanation: "Polyester = plastic. It sheds microplastics in water.",
    ),
    QuizQuestion(
      question: "True or False: Cotton always has a lower environmental impact than polyester.",
      options: ["True", "False"],
      correctIndex: 1,
      explanation: "Cotton can be better, but not always. It depends on method used.",
    ),
    QuizQuestion(
      question: "What is \"greenwashing\"?",
      options: ["A new eco-friendly washing technique", "Misleading sustainability marketing", "Washing clothes using recycled water", "A method for dye removal"],
      correctIndex: 1,
      explanation: "Brands pretend to be sustainable without proof.",
    ),
    QuizQuestion(
      question: "Which fabric has the lowest water footprint?",
      options: ["Cotton", "Linen", "Wool", "Nylon"],
      correctIndex: 1,
      explanation: "Linen (flax) uses far less water.",
    ),
    QuizQuestion(
      question: "Why do fast fashion prices stay low?",
      options: ["Brands use expensive materials", "Very efficient, ethical labour", "Cheap labour + cheap materials", "Limited production"],
      correctIndex: 2,
      explanation: "Low cost = low wages + low-quality fibre.",
    ),
    QuizQuestion(
      question: "Which action reduces fashion waste the most?",
      options: ["Buying more clothes", "Buying fewer, higher-quality clothes", "Following microtrends", "Wearing clothes once"],
      correctIndex: 1,
      explanation: "Longevity = fewer garments produced.",
    ),
    QuizQuestion(
      question: "What is the biggest issue with rapid fashion cycles?",
      options: ["They increase creativity", "They reduce demand", "They encourage disposable buying", "They make clothes more durable"],
      correctIndex: 2,
      explanation: "Fast cycles lead to constant buying and waste.",
    ),
  ];

  static List<QuizQuestion> fashionLevel3 = [
    QuizQuestion(
      question: "Rank fabrics from worst to best environmental impact.",
      options: ["Linen → Wool → Polyester", "Polyester → Cotton → Linen", "Cotton → Polyester → Linen", "Wool → Polyester → Cotton"],
      correctIndex: 1,
      explanation: "Polyester (plastic, energy-heavy) → Cotton (water-heavy) → Linen (lowest footprint).",
    ),
    QuizQuestion(
      question: "Why do not clothing prices reflect environmental impact?",
      options: ["Because pollution is measured incorrectly", "Externalities are not included in price", "Because brands want to overcharge", "Because fashion has no impact"],
      correctIndex: 1,
      explanation: "Pollution is not priced, so clothes appear artificially cheap.",
    ),
    QuizQuestion(
      question: "What is \"planned obsolescence\" in fashion?",
      options: ["Designing clothes that last decades", "Designing clothes that break or become unfashionable quickly", "Designing for repairs", "Designing clothing for upcycling"],
      correctIndex: 1,
      explanation: "Brands make products intentionally short-lived.",
    ),
    QuizQuestion(
      question: "Why is organic cotton not always more sustainable?",
      options: ["It uses more chemicals", "It uses land and water differently", "It cannot be dyed", "It lasts fewer washes"],
      correctIndex: 1,
      explanation: "Organic does not mean low water-use or efficient farming.",
    ),
    QuizQuestion(
      question: "What policy would reduce fashion waste most effectively?",
      options: ["More trend cycles", "Banning second-hand clothing", "Taxing high-waste production", "Increasing billboard ads"],
      correctIndex: 2,
      explanation: "Pricing externalities reduces overproduction.",
    ),
    QuizQuestion(
      question: "What is \"cost per wear\"?",
      options: ["Price divided by number of wears", "Total price multiplied by ownership time", "Price divided by brand name", "Cost of repairing clothes"],
      correctIndex: 0,
      explanation: "Lower cost-per-wear = more sustainable value.",
    ),
    QuizQuestion(
      question: "Why is relying on recycled polyester limited?",
      options: ["It cannot be recycled again", "It is too expensive", "It releases no microplastics", "It is naturally biodegradable"],
      correctIndex: 0,
      explanation: "Most recycled polyester becomes non-recyclable clothing, creating a dead-end.",
    ),
    QuizQuestion(
      question: "Which factor increases sustainability the most?",
      options: ["More trend cycles", "Higher purchasing frequency", "Longer product lifespans", "More polyester production"],
      correctIndex: 2,
      explanation: "Longevity reduces overall consumption and waste.",
    ),
  ];

  // CATEGORY 2: CIRCULAR ECONOMY
  static List<QuizQuestion> circularLevel1 = [
    QuizQuestion(
      question: "What is a circular economy?",
      options: ["An economy based on throwing items away", "An economy where materials are reused, repaired, and recycled", "An economy that only uses new materials", "A system focused on fast production"],
      correctIndex: 1,
      explanation: "A circular economy keeps materials in use for as long as possible.",
    ),
    QuizQuestion(
      question: "Which diagram represents a linear economy?",
      options: ["Make → Use → Return", "Take → Make → Waste", "Repair → Reuse → Recycle", "Collect → Process → Reuse"],
      correctIndex: 1,
      explanation: "A linear economy follows a one-way flow that ends in waste.",
    ),
    QuizQuestion(
      question: "True or False: Repairing an item is part of the circular economy.",
      options: ["True", "False"],
      correctIndex: 0,
      explanation: "Repair extends a product's life and reduces waste.",
    ),
    QuizQuestion(
      question: "What does \"reuse\" mean?",
      options: ["Throwing something away", "Using a product again instead of buying new", "Burning waste for energy", "Replacing a broken item instantly"],
      correctIndex: 1,
      explanation: "Reuse keeps items circulating longer before disposal.",
    ),
    QuizQuestion(
      question: "What is upcycling?",
      options: ["Turning old materials into higher-value products", "Burning materials", "Recycling plastic into plastic", "Throwing clothes away"],
      correctIndex: 0,
      explanation: "Upcycling transforms waste into something of higher value.",
    ),
    QuizQuestion(
      question: "What does \"closing the loop\" mean?",
      options: ["Ending recycling", "Creating waste faster", "Keeping materials in use instead of throwing them away", "Stopping production permanently"],
      correctIndex: 2,
      explanation: "Closing the loop means resources continuously circulate.",
    ),
    QuizQuestion(
      question: "Which example fits a circular model?",
      options: ["Buying new clothes weekly", "Repairing a broken bag", "Throwing out old items", "Ignoring waste"],
      correctIndex: 1,
      explanation: "Repairing prevents unnecessary new consumption.",
    ),
    QuizQuestion(
      question: "Why is extending a product's life good for the environment?",
      options: ["It increases waste", "It reduces production and resource use", "It requires more material", "It raises prices"],
      correctIndex: 1,
      explanation: "The longer an item lasts, the fewer new materials are needed.",
    ),
  ];

  static List<QuizQuestion> circularLevel2 = [
    QuizQuestion(
      question: "Why is the linear economy unsustainable?",
      options: ["It reuses materials", "It depends on infinite resources", "It reduces waste naturally", "It avoids pollution"],
      correctIndex: 1,
      explanation: "Linear systems rely on constant extraction from limited resources.",
    ),
    QuizQuestion(
      question: "What is \"resource efficiency\"?",
      options: ["Using as many materials as possible", "Using materials in the smartest, most sustainable way", "Throwing products away at the end of life", "Over-consuming resources"],
      correctIndex: 1,
      explanation: "Efficient resource use reduces waste and environmental impact.",
    ),
    QuizQuestion(
      question: "True or False: Recycling is the only part of circularity.",
      options: ["True", "False"],
      correctIndex: 1,
      explanation: "Circularity also includes reuse, repair, remanufacturing, and upcycling.",
    ),
    QuizQuestion(
      question: "Which company action reflects circular design?",
      options: ["Designing clothes meant to be thrown away", "Using materials that can be repaired and recycled", "Selling products with no repair options", "Changing trends weekly"],
      correctIndex: 1,
      explanation: "Circular design focuses on durability and long-term usability.",
    ),
    QuizQuestion(
      question: "Which product is most likely to fit into a circular model?",
      options: ["A phone with glued-in batteries", "A jacket with repairable zippers and modular parts", "A shirt designed for one-time use", "A plastic bag"],
      correctIndex: 1,
      explanation: "Modular and repairable items stay in use longer.",
    ),
    QuizQuestion(
      question: "How does upcycling reduce carbon emissions?",
      options: ["By increasing production", "By reducing the need for new materials", "By burning old products", "By shortening product lifespan"],
      correctIndex: 1,
      explanation: "Using existing materials avoids the emissions from making new ones.",
    ),
    QuizQuestion(
      question: "What is \"remanufacturing\"?",
      options: ["Throwing away a product", "Making a new item using old parts", "Ignoring damaged materials", "Always recycling first"],
      correctIndex: 1,
      explanation: "Remanufacturing gives parts a second life.",
    ),
    QuizQuestion(
      question: "Which strategy creates the least waste?",
      options: ["Reuse", "Recycling", "Repair", "Burning waste"],
      correctIndex: 2,
      explanation: "Repair keeps products functional the longest.",
    ),
  ];

  static List<QuizQuestion> circularLevel3 = [
    QuizQuestion(
      question: "How does circularity help fight climate change?",
      options: ["It increases consumption", "It reduces extraction and production emissions", "It causes more pollution", "It promotes fast fashion"],
      correctIndex: 1,
      explanation: "Using fewer virgin materials lowers energy use and emissions.",
    ),
    QuizQuestion(
      question: "Which industry benefits most from circular innovation?",
      options: ["Nuclear energy", "Textile and fashion", "Luxury jewellery", "Airline catering"],
      correctIndex: 1,
      explanation: "Textiles have massive waste and resource demands, so impact is huge.",
    ),
    QuizQuestion(
      question: "Which is the most effective circular strategy?",
      options: ["Recycling", "Reuse", "Repair", "Refuse"],
      correctIndex: 3,
      explanation: "Refusing unnecessary items eliminates waste at the source.",
    ),
    QuizQuestion(
      question: "What makes a product \"circular by design\"?",
      options: ["It is trendy", "It is made to be repaired, reused, or recycled", "It looks eco-friendly", "It is cheap"],
      correctIndex: 1,
      explanation: "Circular-by-design products are built for multiple lifecycles.",
    ),
    QuizQuestion(
      question: "True or False: Recycling is the highest-impact circular solution.",
      options: ["True", "False"],
      correctIndex: 1,
      explanation: "Recycling is useful, but less impactful than reducing, reusing, or repairing.",
    ),
    QuizQuestion(
      question: "Identify a major flaw in current circular systems.",
      options: ["Too much reuse", "Lack of repair skills and infrastructure", "Too many recycling options", "Overproduction of circular products"],
      correctIndex: 1,
      explanation: "Most people cannot repair items, so products still get discarded.",
    ),
    QuizQuestion(
      question: "What is the difference between \"cradle-to-grave\" and \"cradle-to-cradle\"?",
      options: ["Same concept", "Cradle-to-grave ends in waste; cradle-to-cradle recycles into new products", "Cradle-to-grave recycles into new products; cradle-to-cradle ends in waste", "Both ignore recycling"],
      correctIndex: 1,
      explanation: "Cradle-to-cradle is circular; cradle-to-grave is linear.",
    ),
    QuizQuestion(
      question: "A brand claims its product is circular but offers no repair options. What is the issue?",
      options: ["It is too sustainable", "It is greenwashing", "It is too expensive", "It is over-designed"],
      correctIndex: 1,
      explanation: "Circular claims must match real product features like durability and repairability.",
    ),
  ];

  // CATEGORY 3: TEXTILE LIFECYCLE
  static List<QuizQuestion> textileLevel1 = [
    QuizQuestion(
      question: "Which of these is the correct order of a textile lifecycle?",
      options: ["Use → Throw away → Production", "Raw fibre → Fabric → Clothing → Use → Disposal", "Disposal → Fabric → Raw fibre", "Clothing → Fabric → Fibre"],
      correctIndex: 1,
      explanation: "A textile starts as raw fibre, becomes fabric, then clothing, is used, and eventually disposed of.",
    ),
    QuizQuestion(
      question: "Which stage of a textile's life uses the most water?",
      options: ["Spinning", "Dyeing", "Transport", "Packaging"],
      correctIndex: 1,
      explanation: "Dyeing and finishing processes use huge amounts of water.",
    ),
    QuizQuestion(
      question: "True or False: Dyeing is a major source of water pollution.",
      options: ["True", "False"],
      correctIndex: 0,
      explanation: "Toxic dyes often enter rivers and ecosystems untreated.",
    ),
    QuizQuestion(
      question: "What happens to most discarded clothes globally?",
      options: ["They are recycled", "They are stored forever", "They end up in landfill or are burned", "They turn into compost"],
      correctIndex: 2,
      explanation: "Most textile waste is landfilled or incinerated due to lack of recycling options.",
    ),
    QuizQuestion(
      question: "What is pre-consumer textile waste?",
      options: ["Clothes thrown away after wearing", "Factory scraps and offcuts", "Donated clothing", "Old clothes sold second-hand"],
      correctIndex: 1,
      explanation: "Pre-consumer waste is created before the product reaches customers.",
    ),
    QuizQuestion(
      question: "What is post-consumer textile waste?",
      options: ["Scraps from textile factories", "Unused fibres", "Clothes discarded after use", "Fabric rolls in storage"],
      correctIndex: 2,
      explanation: "Post-consumer waste = clothing thrown away after wearing.",
    ),
    QuizQuestion(
      question: "What part of the textile journey often involves the use of pesticides?",
      options: ["Spinning", "Growing cotton", "Sewing", "Recycling"],
      correctIndex: 1,
      explanation: "Conventional cotton growing requires pesticides and chemicals.",
    ),
    QuizQuestion(
      question: "True or False: Polyester sheds microplastics when washed.",
      options: ["True", "False"],
      correctIndex: 0,
      explanation: "Synthetic fibres like polyester break into microplastics during washing.",
    ),
  ];

  static List<QuizQuestion> textileLevel2 = [
    QuizQuestion(
      question: "Which stage of the textile lifecycle creates the most carbon emissions?",
      options: ["Sewing", "Raw material production", "Packaging", "Retail"],
      correctIndex: 1,
      explanation: "Fibre production and processing typically have the highest carbon footprint.",
    ),
    QuizQuestion(
      question: "Why are polyester clothes hard to recycle?",
      options: ["They melt too quickly", "They are often blended with other fibres", "They are too soft", "They are too expensive"],
      correctIndex: 1,
      explanation: "Blended fabrics make fibre separation extremely difficult.",
    ),
    QuizQuestion(
      question: "True or False: Blended fabrics are easier to reuse.",
      options: ["True", "False"],
      correctIndex: 1,
      explanation: "Blends are harder to recycle and reuse due to mixed fibre content.",
    ),
    QuizQuestion(
      question: "What is a key environmental issue in the dyeing stage?",
      options: ["Fabric shrinkage", "Wastewater pollution", "Labour shortages", "Slow production"],
      correctIndex: 1,
      explanation: "Dyeing creates toxic wastewater if not treated properly.",
    ),
    QuizQuestion(
      question: "What is a textile's \"end-of-life\" stage?",
      options: ["The point at which it enters production", "When it is sold", "When it is discarded by the consumer", "When cotton is harvested"],
      correctIndex: 2,
      explanation: "End-of-life refers to disposal after use.",
    ),
    QuizQuestion(
      question: "Why do clothes shed microplastics?",
      options: ["They contain natural fibres", "Synthetic fibres break apart during friction", "They are washed too often", "They are recycled incorrectly"],
      correctIndex: 1,
      explanation: "Polyester and nylon release microplastics when stressed.",
    ),
    QuizQuestion(
      question: "Which stage is most labour-intensive?",
      options: ["Raw material extraction", "Sewing and garment construction", "Disposal", "Recycling"],
      correctIndex: 1,
      explanation: "Cutting, sewing, and assembly rely heavily on manual labour.",
    ),
    QuizQuestion(
      question: "Which stage contributes most to chemical pollution?",
      options: ["Spinning", "Dyeing & finishing", "Retail", "Transport"],
      correctIndex: 1,
      explanation: "Dyeing uses chemicals that can leak into ecosystems.",
    ),
  ];

  static List<QuizQuestion> textileLevel3 = [
    QuizQuestion(
      question: "Why is textile recycling often inefficient?",
      options: ["Fabrics are too clean", "Fibres are hard to separate, especially blends", "No demand for recycled materials", "It requires too much land"],
      correctIndex: 1,
      explanation: "Mixed fibres make automated sorting extremely difficult.",
    ),
    QuizQuestion(
      question: "Which fibre generally has the lowest environmental impact across its lifecycle?",
      options: ["Conventional cotton", "Polyester", "Linen (flax)", "Nylon"],
      correctIndex: 2,
      explanation: "Linen uses less water and chemicals compared to other fibres.",
    ),
    QuizQuestion(
      question: "True or False: Mechanical recycling shortens fibre length.",
      options: ["True", "False"],
      correctIndex: 0,
      explanation: "Shredding breaks fibres, reducing quality.",
    ),
    QuizQuestion(
      question: "What is a major barrier to large-scale textile recycling?",
      options: ["Too many recycling plants", "Lack of sorting technology", "Overproduction of linen", "Low clothing demand"],
      correctIndex: 1,
      explanation: "Sorting blends and colours is complex and expensive.",
    ),
    QuizQuestion(
      question: "Which stage has the largest hidden environmental footprint?",
      options: ["Retail", "Transport", "Consumer use (washing, drying)", "Sewing"],
      correctIndex: 2,
      explanation: "Frequent washing, drying, and ironing use huge amounts of energy.",
    ),
    QuizQuestion(
      question: "What makes chemical recycling different from mechanical recycling?",
      options: ["It dyes fibres", "It dissolves fibres and rebuilds them as new", "It cuts fibres into yarn", "It burns waste"],
      correctIndex: 1,
      explanation: "Chemical recycling breaks fibres down molecularly.",
    ),
    QuizQuestion(
      question: "Why do darker dyed fabrics generally have a higher environmental impact?",
      options: ["They are more expensive", "They require more dye and chemicals", "They dry slower", "They sell less"],
      correctIndex: 1,
      explanation: "Deep colours need more dye, increasing water and chemical use.",
    ),
    QuizQuestion(
      question: "What is the main issue with \"fast fashion lifecycle speed\"?",
      options: ["Clothes last too long", "Clothes become waste too quickly", "Recycling rates are too high", "Clothes never get worn"],
      correctIndex: 1,
      explanation: "Fast fashion speeds up the path from production to disposal.",
    ),
  ];

  // CATEGORY 4: SUSTAINABLE BRANDS
  static List<QuizQuestion> sustainableBrandsLevel1 = [
    QuizQuestion(
      question: "What makes a brand \"sustainable\"?",
      options: ["Selling trendy clothes", "Using materials and practices that reduce environmental harm", "Releasing new collections every week", "Only selling expensive items"],
      correctIndex: 1,
      explanation: "Sustainability = reduced environmental impact + ethical practices.",
    ),
    QuizQuestion(
      question: "True or False: An eco-label always means a brand is sustainable.",
      options: ["True", "False"],
      correctIndex: 1,
      explanation: "Some labels can be misleading or unverified.",
    ),
    QuizQuestion(
      question: "Which of the following is a legitimate sustainability certification?",
      options: ["UltraGreen+", "GOTS", "FashionStar Label", "EcoXPress"],
      correctIndex: 1,
      explanation: "GOTS is a globally trusted organic textile certification.",
    ),
    QuizQuestion(
      question: "What is \"greenwashing\"?",
      options: ["Washing clothes with eco-friendly soap", "Making products green", "Misleading consumers with fake sustainability claims", "Dyeing clothes green"],
      correctIndex: 2,
      explanation: "Greenwashing = false or exaggerated eco-claims.",
    ),
    QuizQuestion(
      question: "What does \"ethical sourcing\" mean?",
      options: ["All materials come from expensive suppliers", "Workers are paid fairly and materials are responsibly produced", "Products are sourced from influencers", "Items are sourced as fast as possible"],
      correctIndex: 1,
      explanation: "Ethical sourcing protects workers and the environment.",
    ),
    QuizQuestion(
      question: "Which brand behaviour is most likely sustainable?",
      options: ["No information about their supply chain", "Extremely low prices", "Publishing detailed sustainability reports", "Releasing 50 collections per year"],
      correctIndex: 2,
      explanation: "Transparency is key to sustainability.",
    ),
    QuizQuestion(
      question: "Why do some sustainable brands cost more?",
      options: ["They want higher profits", "They use higher-quality materials and pay fair wages", "They avoid competition", "They produce small sizes only"],
      correctIndex: 1,
      explanation: "Ethical labour + sustainable materials raise production costs.",
    ),
    QuizQuestion(
      question: "A brand advertises \"eco-friendly\" clothing but provides no proof. What is this?",
      options: ["Good marketing", "Product innovation", "Greenwashing", "A new business model"],
      correctIndex: 2,
      explanation: "Unverified claims = classic greenwashing.",
    ),
  ];

  static List<QuizQuestion> sustainableBrandsLevel2 = [
    QuizQuestion(
      question: "What does \"supply chain transparency\" mean?",
      options: ["Hiding production details", "Showing where materials come from and how products are made", "Revealing secret marketing plans", "Shortening shipping times"],
      correctIndex: 1,
      explanation: "Transparency helps consumers verify sustainability.",
    ),
    QuizQuestion(
      question: "Why might a brand track its carbon footprint?",
      options: ["To raise prices", "To understand and reduce its environmental impact", "To impress customers only", "To calculate shipping delays"],
      correctIndex: 1,
      explanation: "Measuring emissions helps identify reduction opportunities.",
    ),
    QuizQuestion(
      question: "True or False: A brand can still be sustainable if it uses plastic sometimes.",
      options: ["True", "False"],
      correctIndex: 0,
      explanation: "Sustainability depends on total impact, not single materials.",
    ),
    QuizQuestion(
      question: "Which is a sign that a sustainability claim may be false?",
      options: ["Detailed data", "Independent verification", "Vague phrases like \"100% eco-friendly\"", "Transparency reports"],
      correctIndex: 2,
      explanation: "Vague, unverified buzzwords are red flags.",
    ),
    QuizQuestion(
      question: "What is \"circular fashion retail\"?",
      options: ["Selling only circular-shaped clothing", "Reselling, repairing, and renting clothing", "Selling clothes in a circle arrangement", "Only selling sustainable colours"],
      correctIndex: 1,
      explanation: "Circular retail extends clothing lifespan and reduces waste.",
    ),
    QuizQuestion(
      question: "What is the purpose of sustainability reporting?",
      options: ["To list celebrity collaborations", "To brag about profits", "To show impact metrics and accountability", "To hide supply chain issues"],
      correctIndex: 2,
      explanation: "Sustainability reports show progress and areas for improvement.",
    ),
    QuizQuestion(
      question: "Which metric matters most when judging a brand's sustainability?",
      options: ["Number of Instagram followers", "How often they release new trends", "Carbon footprint, water use, labour conditions", "Colour of the logo"],
      correctIndex: 2,
      explanation: "Real sustainability = measurable environmental + social impact.",
    ),
    QuizQuestion(
      question: "Why is traceability important?",
      options: ["It helps track a product from source to consumer", "It reduces brand popularity", "It increases advertising opportunities", "It makes trends last longer"],
      correctIndex: 0,
      explanation: "Traceability ensures materials and labour meet ethical standards.",
    ),
  ];

  static List<QuizQuestion> sustainableBrandsLevel3 = [
    QuizQuestion(
      question: "A brand claims its clothing is \"100% sustainable,\" but offers no data. What does this indicate?",
      options: ["Complete honesty", "Likely greenwashing", "A new marketing style", "High product durability"],
      correctIndex: 1,
      explanation: "Absolute claims with no evidence are misleading.",
    ),
    QuizQuestion(
      question: "What is the difference between ESG and sustainability?",
      options: ["ESG focuses on financial markets; sustainability focuses on environmental & social impact", "They are the same", "ESG only deals with energy", "Sustainability only deals with profits"],
      correctIndex: 0,
      explanation: "ESG evaluates companies for investors; sustainability focuses on real-world impact.",
    ),
    QuizQuestion(
      question: "What makes a sustainability strategy \"scalable\"?",
      options: ["It works only in small shops", "It can expand across supply chains and locations", "It is extremely expensive", "It only applies to luxury brands"],
      correctIndex: 1,
      explanation: "Scalability = ability to expand impact widely.",
    ),
    QuizQuestion(
      question: "A brand claims its products use recycled polyester. What is important to check?",
      options: ["Whether the colours are trendy", "Whether the recycled material is traceable and actually reduces impact", "Whether influencers promote it", "Whether the brand has good packaging"],
      correctIndex: 1,
      explanation: "Recycled claims must be verified and meaningful.",
    ),
    QuizQuestion(
      question: "True or False: Offsetting emissions alone makes a brand sustainable.",
      options: ["True", "False"],
      correctIndex: 1,
      explanation: "Offsetting does not replace real reductions in emissions or waste.",
    ),
    QuizQuestion(
      question: "A brand says \"sustainably sourced materials,\" but investigations show worker abuse in their factories. What is this?",
      options: ["High efficiency", "Greenwashing", "Successful sustainability", "Carbon neutrality"],
      correctIndex: 1,
      explanation: "Sustainability includes labour rights, not just materials.",
    ),
    QuizQuestion(
      question: "Which approach gives the most accurate sustainability evaluation?",
      options: ["Marketing slogans", "Third-party certifications + detailed impact data", "Influencer partnerships", "Fast trend cycles"],
      correctIndex: 1,
      explanation: "Independent verification prevents misleading claims.",
    ),
    QuizQuestion(
      question: "A company uses recycled materials but still overproduces clothing. What is the issue?",
      options: ["Recycled materials are harmful", "Overproduction still causes massive waste", "Recycled fibres never work", "The clothes are too durable"],
      correctIndex: 1,
      explanation: "Sustainability requires reducing production volume, not just changing materials.",
    ),
  ];

  // CATEGORY 5: RECYCLING
  static List<QuizQuestion> recyclingLevel1 = [
    QuizQuestion(
      question: "What is recycling?",
      options: ["Throwing items away", "Turning waste materials into new materials", "Burning waste for energy", "Washing items with water"],
      correctIndex: 1,
      explanation: "Recycling transforms used materials so they can be reused again.",
    ),
    QuizQuestion(
      question: "True or False: All fabrics can be recycled easily.",
      options: ["True", "False"],
      correctIndex: 1,
      explanation: "Many fabrics, especially blends, are difficult or impossible to recycle.",
    ),
    QuizQuestion(
      question: "Why are blended fabrics hard to recycle?",
      options: ["They are too colourful", "The fibres are mixed and hard to separate", "They smell too much", "They are too soft"],
      correctIndex: 1,
      explanation: "Separating fibres like cotton/polyester is technically challenging.",
    ),
    QuizQuestion(
      question: "What is \"downcycling\"?",
      options: ["Turning materials into higher-value products", "Turning materials into lower-value products", "Burning textiles", "Reusing clothes"],
      correctIndex: 1,
      explanation: "Downcycling reduces material quality (e.g., clothes → insulation).",
    ),
    QuizQuestion(
      question: "What is contamination in recycling?",
      options: ["When waste is clean", "When recycling bins are mixed with non-recyclables", "When recycling is too efficient", "When items are washed"],
      correctIndex: 1,
      explanation: "Contamination makes recycling less effective or impossible.",
    ),
    QuizQuestion(
      question: "True or False: Colour affects how easy it is to recycle textiles.",
      options: ["True", "False"],
      correctIndex: 0,
      explanation: "Dark or mixed colours require more chemicals to process.",
    ),
    QuizQuestion(
      question: "What is closed-loop recycling?",
      options: ["Reusing materials until they degrade into waste", "Recycling a material back into the same type of product", "Burning materials for heat", "Shredding materials into dust"],
      correctIndex: 1,
      explanation: "Closed-loop systems create new versions of the original product.",
    ),
    QuizQuestion(
      question: "Which of these is most commonly recycled in textiles?",
      options: ["Pure polyester", "Polyester-cotton blends", "Wool-nylon blends", "Leather"],
      correctIndex: 0,
      explanation: "Pure polyester is easier to process than blends.",
    ),
  ];

  static List<QuizQuestion> recyclingLevel2 = [
    QuizQuestion(
      question: "Which textile is easiest to mechanically recycle?",
      options: ["100% cotton", "Cotton-polyester blend", "Spandex", "Leather"],
      correctIndex: 0,
      explanation: "Pure fibres recycle more smoothly than mixed ones.",
    ),
    QuizQuestion(
      question: "Why does polyester need heat during recycling?",
      options: ["To dye it", "To melt and reshape it", "To wash it", "To make it softer"],
      correctIndex: 1,
      explanation: "Polyester is a plastic that must be melted to be reprocessed.",
    ),
    QuizQuestion(
      question: "True or False: Cotton can be mechanically recycled.",
      options: ["True", "False"],
      correctIndex: 0,
      explanation: "Cotton can be shredded into shorter fibres for reuse.",
    ),
    QuizQuestion(
      question: "Which items should be donated rather than recycled?",
      options: ["Torn clothing", "New or lightly used clothing", "Wet clothing", "Contaminated fabric"],
      correctIndex: 1,
      explanation: "High-quality items should be reused, not broken down.",
    ),
    QuizQuestion(
      question: "Why do many recycling markets collapse?",
      options: ["Too few recycling centres", "No demand for recycled materials", "Recycled products are too durable", "Consumers recycle too much"],
      correctIndex: 1,
      explanation: "Recycling only works when buyers need the recycled output.",
    ),
    QuizQuestion(
      question: "What is a major difference between mechanical and chemical recycling?",
      options: ["Chemical recycling breaks fibres down into their basic molecules", "Mechanical recycling dyes fabrics", "Chemical recycling is always eco-friendly", "Mechanical recycling strengthens fibres"],
      correctIndex: 0,
      explanation: "Chemical recycling molecularly rebuilds fibres.",
    ),
    QuizQuestion(
      question: "Which is more energy-efficient?",
      options: ["Producing new polyester", "Recycling polyester", "Burning polyester", "Mining polyester"],
      correctIndex: 1,
      explanation: "Recycling plastic-based fibres requires less energy than producing new ones.",
    ),
    QuizQuestion(
      question: "What is the biggest issue in textile recycling facilities?",
      options: ["Too many workers", "Sorting materials correctly", "Too few clothes", "Too much technology"],
      correctIndex: 1,
      explanation: "Sorting fabrics by fibre, colour, and quality is extremely difficult.",
    ),
  ];

  static List<QuizQuestion> recyclingLevel3 = [
    QuizQuestion(
      question: "Why is textile recycling not widely scaled?",
      options: ["Consumers do not buy enough clothes", "Sorting technology is expensive and not advanced enough", "Recycling takes too little time", "Recycling is too profitable"],
      correctIndex: 1,
      explanation: "Sorting blends and colours is costly and complex.",
    ),
    QuizQuestion(
      question: "Which recycling method results in the highest-quality output?",
      options: ["Mechanical recycling", "Chemical recycling", "Downcycling", "Burning textiles"],
      correctIndex: 1,
      explanation: "Chemical recycling can rebuild fibres to near-virgin quality.",
    ),
    QuizQuestion(
      question: "True or False: Chemical recycling is always environmentally friendly.",
      options: ["True", "False"],
      correctIndex: 1,
      explanation: "It can require heavy chemicals and high energy use.",
    ),
    QuizQuestion(
      question: "Which type of textile is the biggest barrier to large-scale recycling?",
      options: ["100% cotton", "Wool", "Cotton-polyester blends", "Linen"],
      correctIndex: 2,
      explanation: "Blends are extremely hard to separate into pure fibres.",
    ),
    QuizQuestion(
      question: "Why does recycling alone not solve fashion waste?",
      options: ["Recycling is too fast", "It does not reduce overproduction", "Recycled clothes are too strong", "People dislike recycled materials"],
      correctIndex: 1,
      explanation: "Recycling does not fix the root issue: producing too much.",
    ),
    QuizQuestion(
      question: "What determines how effective textile recycling is?",
      options: ["Fabric colour only", "Fibre purity, contamination, and sorting accuracy", "Brand popularity", "Garment size"],
      correctIndex: 1,
      explanation: "Pure fibres recycle best; contamination lowers recyclability.",
    ),
    QuizQuestion(
      question: "Which factor most limits fibre recovery rates?",
      options: ["Number of trends", "Damage to fibres during mechanical recycling", "Popularity of thrifting", "Fabric colour"],
      correctIndex: 1,
      explanation: "Mechanical recycling shortens fibres, reducing quality.",
    ),
    QuizQuestion(
      question: "What is the biggest weakness of downcycling long-term?",
      options: ["It makes clothes too expensive", "Materials eventually become unusable and still end up as waste", "It creates too much profit", "It makes fibres too strong"],
      correctIndex: 1,
      explanation: "Downcycling delays waste but does not create a closed loop.",
    ),
  ];

  // CATEGORY 6: LIVING A SUSTAINABLE LIFESTYLE
  static List<QuizQuestion> sustainableLivingLevel1 = [
    QuizQuestion(
      question: "What does \"living sustainably\" mean?",
      options: ["Buying as many new products as possible", "Making choices that reduce environmental impact", "Only purchasing luxury items", "Living without electricity"],
      correctIndex: 1,
      explanation: "Sustainability is about reducing harm to the planet.",
    ),
    QuizQuestion(
      question: "True or False: Washing clothes less often can reduce environmental impact.",
      options: ["True", "False"],
      correctIndex: 0,
      explanation: "Laundry uses water, energy, and sheds microplastics.",
    ),
    QuizQuestion(
      question: "What is a simple way to reduce microplastic pollution?",
      options: ["Washing clothes at high temperatures", "Washing synthetic clothes less often", "Buying only dark clothes", "Throwing clothes away quicker"],
      correctIndex: 1,
      explanation: "Less washing = fewer microplastics released.",
    ),
    QuizQuestion(
      question: "What is mindful consumption?",
      options: ["Buying clothes without thinking", "Buying only what you truly need", "Buying anything on sale", "Shopping every weekend"],
      correctIndex: 1,
      explanation: "It is about intentional, reduced consumption.",
    ),
    QuizQuestion(
      question: "Which of these habits is sustainable?",
      options: ["Air-drying clothes", "Using the dryer for every load", "Buying new clothes weekly", "Throwing away repairable items"],
      correctIndex: 0,
      explanation: "Air-drying cuts energy use significantly.",
    ),
    QuizQuestion(
      question: "Why is repairing clothes better than replacing them?",
      options: ["It is always cheaper", "It reduces waste and avoids new production", "It makes clothes look brand new", "It increases fashion trends"],
      correctIndex: 1,
      explanation: "Repairing extends a garment's life and avoids new emissions.",
    ),
    QuizQuestion(
      question: "True or False: Individual actions make no difference in sustainability.",
      options: ["True", "False"],
      correctIndex: 1,
      explanation: "Small actions add up, especially at scale.",
    ),
    QuizQuestion(
      question: "What is a carbon footprint?",
      options: ["A shoe print", "Total greenhouse gases a person or activity produces", "A type of recycled fabric", "A clothing style"],
      correctIndex: 1,
      explanation: "It measures climate impact from daily choices.",
    ),
  ];

  static List<QuizQuestion> sustainableLivingLevel2 = [
    QuizQuestion(
      question: "What is one way to lower your clothing-related carbon footprint?",
      options: ["Buy clothes frequently", "Wash clothes in cold water", "Throw clothes out after one use", "Wash everything at 90 degrees Celsius"],
      correctIndex: 1,
      explanation: "Cold washing reduces energy use dramatically.",
    ),
    QuizQuestion(
      question: "Which pattern of shopping is most sustainable?",
      options: ["Buying fewer, high-quality clothes", "Buying fast fashion weekly", "Buying based on trends only", "Buying only discounted items"],
      correctIndex: 0,
      explanation: "Durability reduces overconsumption and waste.",
    ),
    QuizQuestion(
      question: "True or False: Air drying clothes is more sustainable than using a dryer.",
      options: ["True", "False"],
      correctIndex: 0,
      explanation: "Dryers use lots of electricity; air drying uses none.",
    ),
    QuizQuestion(
      question: "What is one way to reduce waste at home?",
      options: ["Using disposable items", "Choosing reusable products", "Buying unnecessary items", "Using plastic bags frequently"],
      correctIndex: 1,
      explanation: "Reusable items cut waste significantly.",
    ),
    QuizQuestion(
      question: "What daily habit reduces water use?",
      options: ["Washing clothes after every wear", "Taking shorter showers", "Leaving the tap running", "Washing synthetic clothes daily"],
      correctIndex: 1,
      explanation: "Shorter showers save water instantly.",
    ),
    QuizQuestion(
      question: "What is the problem with \"eco-friendly\" trends?",
      options: ["They last forever", "They often encourage buying more", "They save too much energy", "They reduce brand profits"],
      correctIndex: 1,
      explanation: "Overconsumption is still harmful even if items are eco-friendly.",
    ),
    QuizQuestion(
      question: "Which choice is better for the environment?",
      options: ["Throwing away old clothes", "Donating or reselling clothes", "Buying duplicates", "Buying only synthetic fabrics"],
      correctIndex: 1,
      explanation: "Reuse extends the life of garments.",
    ),
    QuizQuestion(
      question: "Why do sustainable habits matter long-term?",
      options: ["They save time", "They compound — small habits create large impact", "They eliminate all emissions instantly", "They make clothes last forever"],
      correctIndex: 1,
      explanation: "Consistent habits add up to major environmental savings.",
    ),
  ];

  static List<QuizQuestion> sustainableLivingLevel3 = [
    QuizQuestion(
      question: "Which lifestyle change has the highest environmental impact?",
      options: ["Buying new clothes monthly", "Reducing overall consumption", "Washing synthetic clothes more often", "Air-drying only"],
      correctIndex: 1,
      explanation: "Reducing consumption cuts emissions, waste, and resource use.",
    ),
    QuizQuestion(
      question: "Why is \"buying eco-friendly items\" not always sustainable?",
      options: ["Eco-items do not work", "It still encourages consumption", "They are illegal", "They last too long"],
      correctIndex: 1,
      explanation: "The most sustainable item is the one you do not buy.",
    ),
    QuizQuestion(
      question: "True or False: Microplastic pollution only comes from oceans.",
      options: ["True", "False"],
      correctIndex: 1,
      explanation: "Most microplastics come from washing clothes and daily activities.",
    ),
    QuizQuestion(
      question: "What is a realistic long-term sustainable goal?",
      options: ["Never buying clothes again", "Slowly shifting to durable, repairable items", "Throwing away everything synthetic", "Buying only luxury brands"],
      correctIndex: 1,
      explanation: "Sustainable transitions happen gradually and practically.",
    ),
    QuizQuestion(
      question: "Which action reduces waste the MOST?",
      options: ["Recycling everything", "Avoiding unnecessary purchases", "Washing clothes in hot water", "Buying duplicates"],
      correctIndex: 1,
      explanation: "Avoiding waste at the source is the highest-impact solution.",
    ),
    QuizQuestion(
      question: "What is a \"waste footprint\"?",
      options: ["Trash left on the ground", "Total waste an individual or household produces", "Footprint size", "The amount a person recycles"],
      correctIndex: 1,
      explanation: "It tracks how much waste you generate overall.",
    ),
    QuizQuestion(
      question: "Which is a common mistake in attempting sustainable living?",
      options: ["Repairing items", "Buying excess \"eco-friendly\" products", "Reducing consumption", "Using fewer resources"],
      correctIndex: 1,
      explanation: "Buying too many eco items still leads to unnecessary waste.",
    ),
    QuizQuestion(
      question: "Why do lifestyle changes need to be maintained consistently?",
      options: ["One-time actions do not create lasting environmental impact", "Sustainability is only about trends", "Governments require it", "It is expensive otherwise"],
      correctIndex: 0,
      explanation: "Long-term behaviour creates long-term environmental benefits.",
    ),
  ];
}
