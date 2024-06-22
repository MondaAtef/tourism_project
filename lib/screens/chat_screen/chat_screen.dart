import 'package:auto_direction/auto_direction.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart'; // تأكد من تضمين حزمة Gemini

const String GEMINI_API_KEY = 'AIzaSyATicaAafi-vz0hgnOkp_U132hG_6Y3yaw';

// تعريف قائمة الأسئلة والأجوبة
List<Map<String, String>> faq = [
  {
    "question": "كيف يمكنني تخطيط رحلتي باستخدام التطبيق؟",
    "answer":
    "يمكنك تخطيط رحلتك من خلال الوصول إلى ميزة 'تخطيط الرحلة'، حيث يقترح النظام مسارات رحلات محسنة تركز على السياحة المستدامة. يمكنك أيضًا تخصيص خطة رحلتك بناءً على تفضيلاتك."
  },
  {
    "question": "هل تتوفر مسارات رحلات جاهزة؟",
    "answer":
    "نعم، يوفر النظام مسارات رحلات جاهزة تعطي الأولوية لممارسات السياحة المستدامة. يمكنك الاختيار من بين مجموعة متنوعة من الخيارات المصممة لتناسب اهتمامات ومدد زمنية مختلفة."
  },
  {
    "question": "كيف يمكنني العثور على أماكن إقامة صديقة للبيئة في الأقصر؟",
    "answer":
    "يمكنك العثور على أماكن إقامة صديقة للبيئة من خلال الوصول إلى ميزة 'توصيات الإقامة'، حيث يوصي النظام بفنادق مستدامة بناءً على تفضيلاتك."
  },
  {
    "question": "كيف يمكنني الوصول إلى تعليمات الحفاظ على البيئة في كل موقع؟",
    "answer":
    "يتم توفير تعليمات الحفاظ على البيئة في كل موقع من خلال ميزة 'تعليمات الحفاظ على البيئة' التي تعتمد على موقعك باستخدام GPS. يمكنك الوصول إلى هذه التعليمات لتقليل تأثيرك البيئي أثناء زيارتك."
  },
  {
    "question": "هل يتوفر التطبيق بعدة لغات؟",
    "answer":
    "نعم، يتوفر التطبيق بعدة لغات لتلبية احتياجات مجموعة واسعة من المستخدمين. يمكنك اختيار لغتك المفضلة من إعدادات التطبيق للوصول إلى المحتوى بلغتك المفضلة."
  },
  {
    "question": "كيف يمكنني تقليل بصمتي البيئية أثناء استكشاف الأقصر؟",
    "answer":
    "يمكنك تقليل بصمتك البيئية باستخدام وسائل النقل الصديقة للبيئة مثل الدراجات أو الحافلات العامة، ودعم المبادرات المحلية للحفاظ على البيئة، واختيار أماكن إقامة تتبع ممارسات مستدامة."
  },
  {
    "question":
    "ما هي الممارسات المستدامة التي يجب علي اتباعها عند زيارة المواقع الأثرية في الأقصر؟",
    "answer":
    "عند زيارة المواقع الأثرية في الأقصر، من المهم اتباع الإرشادات مثل البقاء على المسارات المحددة، وعدم لمس أو إزالة القطع الأثرية، واحترام الأهمية الثقافية للموقع."
  },
  {
    "question": "هل هناك خيارات نقل صديقة للبيئة متاحة للتجول في الأقصر؟",
    "answer":
    "نعم، توفر الأقصر خيارات نقل صديقة للبيئة مثل الدراجات الكهربائية، العربات التي تجرها الخيول، والجولات السياحية سيرًا على الأقدام التي تتيح لك استكشاف المدينة مع تقليل تأثيرك البيئي."
  },
  {
    "question": "هل يمكنني التعرف على الحرف اليدوية التقليدية في الأقصر؟",
    "answer":
    "نعم، يمكنك التعرف على الحرف اليدوية التقليدية في الأقصر من خلال زيارة الأسواق المحلية، وورش العمل، والمراكز الثقافية حيث يعرض الحرفيون مهاراتهم ويبيعون المنتجات اليدوية."
  },
  {
    "question":
    "كيف يمكنني دعم مبادرات السياحة المستدامة في الأقصر بعد مغادرتي؟",
    "answer":
    "يمكنك دعم مبادرات السياحة المستدامة في الأقصر من خلال مشاركة تجاربك الإيجابية مع الآخرين ودعم المنظمات التي تروج للسياحة المستدامة في المنطقة."
  },
  {
    "question":
    "ما هي الخطوات التي يجب علي اتخاذها لضمان أن أكون محترمًا ثقافيًا أثناء أنشطتي السياحية؟",
    "answer":
    "يجب عليك احترام العادات والتقاليد المحلية، والحصول على إذن قبل التقاط الصور، والتفاعل مع المجتمعات المحلية باحترام، ودعم الأعمال التجارية المسؤولة ثقافيًا."
  },
  {
    "question":
    "ما هي بعض الخيارات المستدامة للهدايا التذكارية التي يمكنني شراؤها في الأقصر؟",
    "answer":
    "تشمل الخيارات المستدامة للهدايا التذكارية في الأقصر الحرف اليدوية المحلية، والمنسوجات المصنوعة يدويًا، والمجوهرات التقليدية، والمنتجات الصديقة للبيئة التي يتم الحصول عليها من الحرفيين المحليين."
  },
  {
    "question": "كيف يمكنني تقليل النفايات أثناء السفر في الأقصر؟",
    "answer":
    "يمكنك تقليل النفايات من خلال حمل زجاجة مياه قابلة لإعادة الاستخدام، وتجنب البلاستيك المستخدم لمرة واحدة، والتخلص من النفايات بشكل مسؤول في الحاويات المخصصة أو مرافق إعادة التدوير."
  },
  {
    "question": "هل يمكنني تخصيص خطة رحلتي وفقًا لاهتماماتي؟",
    "answer":
    "بالتأكيد! يوفر تطبيقنا خطط رحلات محسنة تعطي الأولوية لممارسات السياحة المستدامة. لديك المرونة في تخصيص رحلتك بناءً على اهتماماتك وميزانيتك وأهدافك المتعلقة بالاستدامة. يتيح لك ذلك استكشاف الأقصر بطريقة تتماشى مع قيمك مع تقليل بصمتك البيئية."
  },
  {
    "question": "هل توجد فنادق صديقة للبيئة موصى بها؟",
    "answer":
    "نعم، نوصي بفنادق صديقة للبيئة بناءً على تفضيلاتك وتوافرها. تلعب هذه الإقامات دورًا حيويًا في السياحة المسؤولة، وتضمن توصياتنا إقامة مريحة ومستدامة في الأقصر."
  },
  {
    "question": "كيف يمكن أن يساعدني الروبوت الدردشة أثناء رحلتي؟",
    "answer":
    "تم تصميم روبوت الدردشة لتقديم إرشادات حول ممارسات السياحة المستدامة، والإجابة على استفساراتك، واقتراح الأنشطة أو المعالم. يساعدك على اتخاذ قرارات مستنيرة أثناء استكشاف الأقصر، مما يضمن تجربة سفر لا تُنسى ومسؤولة."
  },
  {
    "question":
    "كيف يمكنني العثور على مواقع مستدامة في الأقصر باستخدام ميزة الخريطة؟",
    "answer":
    "تعرض ميزة الخريطة الأماكن الخضراء والمستدامة مثل الفنادق الصديقة للبيئة، والمحميات الطبيعية، والمواقع الثقافية. تشير الألوان المختلفة على الخريطة إلى أنواع مختلفة من المواقع المستدامة، مما يسهل عليك التعرف عليها واستكشافها. تشجعك هذه الميزة على زيارة الوجهات المستدامة وتعزز سلوك السفر المسؤول."
  },
  {
    "question": "ما هي تعليمات الحفاظ على البيئة المتاحة في كل موقع؟",
    "answer":
    "تعليمات الحفاظ على البيئة مخصصة لموقعك باستخدام GPS لتعلمك بطرق تقليل تأثيرك البيئي أثناء زيارتك. من خلال اتباع هذه الإرشادات، تساهم في الحفاظ على التراث الطبيعي والثقافي في الأقصر."
  },
  {
    "question":
    "كيف يمكنني إنشاء ألبوم صور رقمي لتوثيق تجاربي في السفر المستدام؟",
    "answer":
    "يمكنك إنشاء ألبومات صور رقمية لتوثيق تجاربك في السفر المستدام في الأقصر. يدعم تطبيقنا تخزين الصور بسهولة واسترجاعها ومشاركتها، مما يتيح لك مشاركة ذكرياتك مع الآخرين وتعزيز السياحة المستدامة."
  },
  {
    "question": "هل يتوفر التطبيق بعدة لغات؟",
    "answer":
    "نعم، نوفر التطبيق بعدة لغات لضمان الوصول إلى مجموعة متنوعة من المستخدمين، بما في ذلك السياح الدوليين. يعزز دعم اللغات تجربتك ويسهل التواصل، مما يجعل التطبيق أكثر شمولية وسهولة في الاستخدام."
  },
  {
    "question": "كيف يمكنني تضمين تجارب ثقافية في خطة رحلتي المستدامة؟",
    "answer":
    "يمكنك تخصيص خطة رحلتك لتشمل تجارب ثقافية مثل زيارة المعالم التاريخية والمتاحف والمهرجانات التقليدية. تضمن توصياتنا أنك تشارك في التراث الثقافي للأقصر مع تعزيز الاستدامة."
  },
  {
    "question": "ما هي المعايير المستخدمة لتوصية الفنادق الصديقة للبيئة؟",
    "answer":
    "نوصي بالفنادق الصديقة للبيئة بناءً على معايير مثل كفاءة الطاقة، وممارسات إدارة النفايات، والمشاركة المجتمعية، والشهادات مثل Green Key أو EarthCheck. تعطي هذه الإقامات الأولوية للاستدامة مع تقديم إقامة مريحة للمسافرين."
  },
  {
    "question":
    "هل هناك خيارات اقتصادية بين الفنادق الصديقة للبيئة الموصى بها؟",
    "answer":
    "نعم، نوفر مجموعة من الفنادق الصديقة للبيئة لتناسب مختلف الميزانيات. يمكنك تصفية تفضيلاتك للعثور على خيارات إقامة مستدامة ومعقولة التكلفة في الأقصر."
  },
  {
    "question": "ما مدى دقة ميزة الخريطة في تحديد المواقع المستدامة؟",
    "answer":
    "تستخدم ميزة الخريطة بيانات جغرافية دقيقة لتحديد وعرض المواقع المستدامة في الأقصر. نتعاون مع السلطات المحلية والمنظمات لضمان موثوقية وصحة المعلومات المقدمة."
  },
  {
    "question": "هل يمكنني التنقل إلى المواقع المستدامة باستخدام ميزة الخريطة؟",
    "answer":
    "نعم، يمكنك استخدام ميزة الخريطة للتنقل إلى المواقع المستدامة مثل الفنادق"
  },
  {
    "question": "ما هي أشهر المطاعم التي تدعم الاستدامة في الأقصر؟",
    "answer":
    "مطعم صُفرة: مأكولات مصرية تقليدية مع مكونات طازجة ومحلية\n مطعم نفرتاري: تجربة تناول الطعام على جزيرة فيلة بمكونات محلية وصحية\n مطعم سكارابيو: أطباق عضوية وصحية مع إطلالات على نهر النيل\n مطعم كارما: أطباق نباتية ونباتية صديقة للبيئة مع مكونات محلية\n مطعم الموديرا: أطباق متنوعة ومستدامة مع خدمة ممتازة"
  },
  {
    "question": "ماذا عن مطعم صُفرة؟",
    "answer":
    "الوصف: يقدم مطعم صُفرة المأكولات المصرية التقليدية باستخدام مكونات طازجة ومحلية\n الاستدامة: يدعم المطعم المزارعين المحليين ويهدف إلى تقليل النفايات من خلال ممارسات مستدامة.\n الموقع: شارع سيدي أبو الحجاج، الأقصر، مصر."
  },
  {
    "question": "ماذا عن مطعم نفرتاري؟",
    "answer":
    "الوصف: يقع مطعم نفرتاري على جزيرة فيلة، ويشتهر بتقديم تجربة طعام ممتعة مع مناظر طبيعية خلابة.\n الاستدامة: يستخدم مكونات محلية وصحية، ويدعم المزارعين المحليين، ويركز على تقليل بصمته الكربونية.\n الموقع: جزيرة فيلة، الأقصر، مصر."
  },
  {
    "question": "ماذا عن مطعم سكارابيو؟",
    "answer":
    "الوصف: يُعرف مطعم سكارابيو بأطباقه العضوية والصحية، ويقدم جوًا هادئًا مع إطلالات على نهر النيل.\n الاستدامة: يعتمد على المكونات المحلية والعضوية ويدعم الممارسات المستدامة.\n الموقع: كورنيش النيل، الأقصر، مصر."
  },
  {
    "question": "ماذا عن مطعم كارما؟",
    "answer":
    "الوصف: يتخصص مطعم كارما في تقديم أطباق نباتية وصديقة للنباتيين. يشتهر بقائمة طعامه اللذيذة والمبتكرة.\n الاستدامة: يستخدم المطعم مكونات طازجة ومحلية ويركز على تقليل الأثر البيئي.\n الموقع: شارع المدينة، الأقصر، مصر."
  },
  {
    "question": "ماذا عن مطعم الموديرا؟",
    "answer":
    "الوصف: يقدم مطعم الموديرا مجموعة متنوعة من الأطباق باستخدام مكونات محلية ومستدامة، ويوفر تجربة طعام فريدة مع خدمة ممتازة.\n الاستدامة: ملتزم بتقديم طعام مستدام ويدعم المجتمع المحلي من خلال شراء المنتجات المحلية.\n الموقع: شارع الكورنيش، الأقصر، مصر."
  },
  {
    "question": "ما هي أشهر الفنادق التي تدعم الاستدامة في الأقصر؟",
    "answer":
    "فندق الموديرا\n فندق شتايجنبرجر نايل بالاس\n فندق سونستا سانت جورج\n منتجع شتايجنبرجر أختي"
  },
  {
    "question": "ماذا عن فندق الموديرا؟",
    "answer":
    "الوصف: فندق الموديرا هو فندق فاخر يمزج بين الطراز العربي التقليدي والراحة العصرية. يتميز بديكور فاخر وضيافة دافئة.\n الاستدامة: يركز الفندق على الاستدامة من خلال مبادرات إدارة النفايات، والحفاظ على الطاقة، والمشاركة المجتمعية.\n الموقع: يقع في منطقة هادئة على بعد حوالي 4 كيلومترات من المعابد القديمة في الأقصر، مما يجعله مثاليًا لمن يبحثون عن الهدوء والاستكشاف الثقافي."
  },
  {
    "question": "ماذا عن فندق شتايجنبرجر نايل بالاس؟",
    "answer":
    "الوصف: فندق شتايجنبرجر نايل بالاس هو من أفضل الفنادق في الأقصر، حيث يقدم إطلالات خلابة على نهر النيل ومرافق فاخرة.\n الاستدامة: يعتمد الفندق على ممارسات الاستدامة بما في ذلك تقليل الأثر البيئي والحفاظ على الموارد الطبيعية.\n الموقع: يقع على كورنيش النيل في الأقصر، على مسافة قصيرة من المعابد الشهيرة ومرافق التسوق."
  },
  {
    "question": "ماذا عن فندق سونستا سانت جورج؟",
    "answer":
    "الوصف: فندق سونستا سانت جورج هو فندق فاخر معاصر يتميز بمرافق عالمية الطراز وديكور أنيق.\n الاستدامة: ينفذ الفندق ممارسات مستدامة في إدارة الموارد والحفاظ على البيئة.\n الموقع: يقع على ضفاف النيل، بالقرب من معبد الكرنك والمواقع الأثرية في الأقصر، مما يجعله مثاليًا للاسترخاء والاستكشاف التاريخي."
  },
  {
    "question": "ماذا عن منتجع شتايجنبرجر أختي؟",
    "answer":
    "الوصف: منتجع شتايجنبرجر أختي هو منتجع مثالي للمسافرين الباحثين عن الاسترخاء والراحة، مع إطلالات خلابة على جبال الأقصر.\n الاستدامة: يركز المنتجع على الاستدامة من خلال سياسات صديقة للبيئة في إدارة الموارد وتقليل النفايات.\n الموقع: يقع على ضفاف النيل في الأقصر، على بعد مسافة قصيرة بالسيارة من معبد الكرنك والمعالم التاريخية."
  },
  {
    "question":
    "What are the most popular restaurants that support sustainability in Luxor?",
    "answer":
    "sofra Restaurant: Traditional Egyptian cuisine with fresh, local ingredients\n Nefertari Restaurant:Dining experience on Philae Island with local, healthy ingredients\n Scarabeo Restaurant: Organic and healthy dishes with Nile River views\n Karma Restaurant: Vegetarian and vegan-friendly dishes with local ingredients\n Al-Moudira Restaurant: Diverse, sustainable dishes with excellent service"
  },
  {
    "question": "What about Sofra Restaurant?",
    "answer":
    "description: Sofra Restaurant offers traditional Egyptian cuisine using fresh, local ingredients\nsustainability: The restaurant supports local farmers and aims to reduce waste through sustainable     practices.\n location :Sidi Abu El Haggag Street, Luxor, Egypt."
  },
  {
    "question": "What about Nefertari Restaurant?",
    "answer":
    "description:Located on Philae Island, Nefertari Restaurant is known for providing a delightful dining experience with stunning natural views.\n sustainability: It uses local and healthy ingredients, supports local farmers, and focuses on reducing its carbon footprint. \n location Philae Island, Luxor, Egypt."
  },
  {
    "question": "What about Scarabeo Restaurant?",
    "answer":
    "description: Scarabeo Restaurant is known for its organic and healthy dishes, offering a serene ambiance with views of the Nile River.\n sustainability: It relies on local and organic ingredients and supports sustainable practices.\n location: Nile Corniche, Luxor, Egypt."
  },
  {
    "question": "What about Karma Restaurant?",
    "answer":
    "description: Karma Restaurant specializes in offering vegetarian and vegan-friendly dishes. It is known for its delicious and innovative menu.\n sustainability: The restaurant uses fresh, local ingredients and focuses on reducing environmental impact.\n location: Al Madina Street, Luxor, Egypt."
  },
  {
    "question": "What about Al-Moudira Restaurant?",
    "answer":
    "description:Al-Moudira Restaurant offers a diverse range of dishes using local and sustainable ingredients, providing a unique dining experience with excellent service.\n sustainability: It is committed to serving sustainable food and supports the local community by sourcing local products.\n location: Corniche Street, Luxor, Egypt."
  },
  {
    "question":
    "What are the most popular Hotels that support sustainability in Luxor?",
    "answer":
    "Al Moudira Hotel\n Steigenberger Nile Palace Hotel \n Sonesta St. George Hotel Hotel\n Steigenberger Resort Achti Hotel"
  },
  {
    "question": "What about Al-Moudira Hotel?",
    "answer":
    "description :Al Moudira Hotel is a luxurious hotel blending traditional Arabic style with modern comfort. It features lavish décor and warm hospitality\n sustainability: The hotel emphasizes sustainability through waste management initiatives, energy conservation, and community engagement\n location: Located in a serene area about 4 kilometers from Luxor's ancient temples, making it ideal for those seeking tranquility and cultural exploration."
  },
  {
    "question": "What about Steigenberger Nile Palace Hotel ?",
    "answer":
    "description: Steigenberger Nile Palace Hotel is one of Luxor's finest hotels, offering stunning views of the Nile River and luxurious amenities.\nsustainability: The hotel adopts sustainability practices including reducing environmental footprint and preserving natural resources.\nlocation: Situated on the Corniche in Luxor, a short distance from the famous Luxor temples and shopping facilities."
  },
  {
    "question": "What about Sonesta St. George Hotel?",
    "answer":
    "description: Sonesta St. George Hotel is a contemporary luxury hotel with world-class facilities and elegant décor.\n sustainability:  The hotel implements sustainable practices in resource management and environmental conservation \n location: Located on the banks of the Nile, close to the Karnak Temple and Luxor's archaeological sites, making it perfect for relaxation and historical exploration."
  },
  {
    "question": "What about Steigenberger Resort Achti?",
    "answer":
    "description: Steigenberger Resort Achti is an ideal resort for travelers seeking relaxation and comfort, with breathtaking views of Luxor's mountains.\nsustainability: The resort focuses on sustainability through eco-friendly policies in resource management and waste reduction.\n location: Situated on the banks of the Nile in Luxor, a short drive from the Karnak Temple and historical landmarks."
  },
  {
    "question": "How can I plan my trip using the application?",
    "answer":
    "You can plan your trip by accessing the 'Trip Planning' feature, where the system suggests optimized trip itineraries focused on sustainable tourism. You can also customize your trip plan based on your preferences."
  },
  {
    "question": "Are there pre-made trip itineraries available?",
    "answer":
    "Yes, the system provides pre-made trip itineraries that prioritize sustainable tourism practices. You can choose from a variety of options tailored to different interests and durations."
  },
  {
    "question": "How can I find eco-friendly accommodations in Luxor?",
    "answer":
    "You can find eco-friendly accommodations by accessing the 'Accommodation Recommendations' feature, where the system recommends sustainable hotels based on your preferences."
  },
  {
    "question":
    "How can I access environmental preservation instructions at each location?",
    "answer":
    "Environmental preservation instructions are provided at each location through the 'Instructions for Environmental Preservation' feature, which is based on your location using GPS. You can access these instructions to minimize your environmental impact during your visit."
  },
  {
    "question": "Is the application available in multiple languages?",
    "answer":
    "Yes, the application is available in various languages to accommodate a wide range of users. You can select your preferred language from the app settings to access the content in your preferred language."
  },
  {
    "question":
    "How can I minimize my environmental footprint while exploring Luxor?",
    "answer":
    "You can minimize your environmental footprint by using eco-friendly transportation options like bicycles or public buses, supporting local conservation initiatives, and choosing accommodations with sustainable practices."
  },
  {
    "question":
    "What sustainable practices should I follow when visiting archaeological sites in Luxor?",
    "answer":
    "When visiting archaeological sites in Luxor, it's important to follow guidelines such as staying on designated paths, not touching or removing artifacts, and respecting the site's cultural significance."
  },
  {
    "question":
    "Are there any eco-friendly transportation options available for getting around Luxor?",
    "answer":
    "Yes, Luxor offers eco-friendly transportation options such as electric bikes, horse-drawn carriages, and walking tours that allow you to explore the city while minimizing your environmental impact."
  },
  {
    "question":
    "Can I learn about traditional crafts and handicrafts in Luxor?",
    "answer":
    "Yes, you can learn about traditional crafts and handicrafts in Luxor by visiting local markets, workshops, and cultural centers where artisans showcase their skills and sell handmade products."
  },
  {
    "question":
    "How can I support sustainable tourism initiatives in Luxor after leaving?",
    "answer":
    "You can support sustainable tourism initiatives in Luxor by sharing your positive experiences with others and supporting organizations that promote sustainable tourism in the region."
  },
  {
    "question":
    "What steps should I take to ensure I'm culturally respectful during my tourism activities?",
    "answer":
    "You should respect local customs and traditions, seek permission before taking photos, engage with local communities respectfully, and support culturally responsible businesses."
  },
  {
    "question":
    "What are some sustainable souvenir options I can purchase in Luxor?",
    "answer":
    "Sustainable souvenir options in Luxor include locally-made crafts, handmade textiles, traditional jewelry, and eco-friendly products sourced from local artisans."
  },
  {
    "question": "How can I reduce my waste while traveling in Luxor?",
    "answer":
    "You can reduce waste by carrying a reusable water bottle, avoiding single-use plastics, and disposing of waste responsibly in designated bins or recycling facilities."
  },
  {
    "question": "Can I customize my trip plan according to my interests?",
    "answer":
    "Absolutely! Our application offers optimized trip plans that prioritize sustainable tourism practices. You have the flexibility to customize your trip based on your interests, budget, and sustainability goals. This empowers you to explore Luxor in a way that aligns with your values while minimizing your environmental footprint."
  },
  {
    "question": "Are there any eco-friendly hotels recommended?",
    "answer":
    "Yes, we recommend eco-friendly hotels based on your preferences and availability. These accommodations play a crucial role in responsible tourism, and our recommendations ensure you have a comfortable and sustainable stay in Luxor."
  },
  {
    "question": "How can the chat bot assist me during my trip?",
    "answer":
    "The chat bot is designed to offer guidance on sustainable tourism practices, answer your queries, and suggest activities or attractions. It helps you make informed decisions while exploring Luxor, ensuring a memorable and responsible travel experience."
  },
  {
    "question":
    "How can I find sustainable locations in Luxor using the map feature?",
    "answer":
    "The map feature displays green and sustainable places such as eco-friendly hotels, nature reserves, and cultural sites. Different colors on the map signify different types of sustainable locations, making it easy for you to identify and explore them. This feature encourages you to visit sustainable destinations and promotes responsible travel behavior."
  },
  {
    "question":
    "What environmental preservation instructions are available at each location?",
    "answer":
    "Environmental preservation instructions tailored to your location using GPS educate you on ways to minimize your environmental impact during your visit. By following these guidelines, you contribute to the preservation of Luxor's natural and cultural heritage."
  },
  {
    "question":
    "How can I create a digital photo book of my sustainable travel experiences?",
    "answer":
    "You can create digital photo books to document your sustainable travel experiences in Luxor. Our application supports easy storage, retrieval, and sharing of photos, allowing you to share your memories with others and promote sustainable tourism."
  },
  {
    "question": "Is the application available in multiple languages?",
    "answer":
    "Yes, we offer the application in multiple languages to ensure accessibility to a diverse range of users, including international tourists. Language support enhances your experience and facilitates communication, making the application more inclusive and user-friendly."
  },
  {
    "question":
    "How can I include cultural experiences in my sustainable trip plan?",
    "answer":
    "You can customize your trip plan to include cultural experiences such as visits to historical landmarks, museums, and traditional festivals. Our recommendations ensure you engage with Luxor's cultural heritage while promoting sustainability."
  },
  {
    "question": "What criteria are used to recommend eco-friendly hotels?",
    "answer":
    "We recommend eco-friendly hotels based on criteria such as energy efficiency, waste management practices, community engagement, and certifications like Green Key or EarthCheck. These accommodations prioritize sustainability while offering comfortable stays for travelers."
  },
  {
    "question":
    "Are there budget-friendly options among the recommended eco-friendly hotels?",
    "answer":
    "Yes, we provide a range of eco-friendly hotels to suit various budgets. You can filter your preferences to find affordable and sustainable accommodation options in Luxor."
  },
  {
    "question":
    "How accurate is the map feature in identifying sustainable locations?",
    "answer":
    "The map feature utilizes accurate geospatial data to identify and display sustainable locations in Luxor. We collaborate with local authorities and organizations to ensure the reliability and relevance of the information provided."
  },
  {
    "question":
    "Can I navigate to sustainable locations using the map feature?",
    "answer":
    "Yes, you can use the map feature to navigate to sustainable locations such as eco-friendly hotels, nature reserves, and cultural sites. The interactive map makes it easy for you to explore Luxor responsibly and enjoy eco-conscious travel experiences."
  },
  {
    "question":
    "What specific environmental guidelines should I follow when visiting archaeological sites in Luxor?",
    "answer":
    "When visiting archaeological sites, it's important to respect signage, avoid touching or damaging ancient structures, and dispose of waste properly. Our environmental preservation instructions provide guidance on responsible behavior to protect Luxor's cultural heritage."
  },
  {
    "question":
    "How can I minimize my environmental impact while exploring Luxor's natural attractions?",
    "answer":
    "To minimize your environmental impact, practice Leave No Trace principles such as packing out waste, staying on designated trails, and avoiding wildlife disturbance. Our instructions for environmental preservation offer tips for responsible behavior in natural areas."
  },
  {
    "question": "Can I share my digital photo book with friends and family?",
    "answer":
    "Yes, you can easily share your digital photo book with friends and family through social media platforms, email, or messaging apps. Document your sustainable travel experiences in Luxor and inspire others to adopt eco-friendly practices."
  },
  {
    "question":
    "How can tourists ensure their visit to Luxor supports sustainable development?",
    "answer":
    "Tourists can support sustainable development in Luxor by choosing eco-friendly accommodations, respecting cultural and environmental sensitivities, minimizing their carbon footprint, and contributing to local conservation efforts through responsible tourism activities."
  },
  {
    "question": "What is sustainable tourism?",
    "answer":
    "Sustainable tourism refers to tourism activities that strive to minimize negative environmental, social, and cultural impacts while maximizing benefits for local communities, economies, and ecosystems, both now and in the future."
  },
  {
    "question": "What are some sustainable attractions to visit in Luxor?",
    "answer":
    "Some sustainable attractions in Luxor include Karnak Temple, Luxor Temple, Valley of the Kings, Valley of the Queens, and Hatshepsut's Temple. These historical sites offer rich cultural experiences while promoting responsible tourism practices."
  },
  {
    "question": "What about Luxor Temple?",
    "answer":
    "Luxor Temple is one of the most significant ancient Egyptian temples located on the east bank of the Nile River in Luxor, Egypt. Connected to the Karnak Temple Complex by the Avenue of Sphinxes, it was constructed around 1400 BCE during the New Kingdom period."
  },
  {
    "question": "What about Karnak Temple?",
    "answer":
    "The Karnak Temple Complex in Luxor, Egypt, is one of the largest temple complexes ever built, including the iconic Great Hypostyle Hall and the Precinct of Amun-Re. Connected to Luxor Temple by the Avenue of Sphinxes, Karnak Temple is a UNESCO World Heritage Site and a major tourist attraction."
  },
  {
    "question": "What about Luxor Museum?",
    "answer":
    "The Luxor Museum is an archaeological museum located on the east bank of the Nile River in Luxor, Egypt. It houses a remarkable collection of artifacts from the ancient Egyptian era, including statues, reliefs, pottery, and jewelry. The museum provides visitors with insights into ancient Egyptian history, culture, and artistry."
  },
  {
    "question": "What about Avenue of Sphinxes?",
    "answer":
    "The Avenue of Sphinxes is a historic pathway lined with sphinx statues that once connected the Luxor Temple to the Karnak Temple Complex in Luxor, Egypt. It served as a ceremonial pathway for religious processions."
  },
  {
    "question": "What about Hatshepsut Temple?",
    "answer":
    "The Hatshepsut Temple, also known as the Temple of Queen Hatshepsut or Deir el-Bahari, is an ancient Egyptian temple located on the west bank of the Nile River near Luxor. It is a remarkable ancient Egyptian temple built by Queen Hatshepsut and serves as a mortuary temple dedicated to the god Amun and her father Thutmose I. The temple consists of three levels: an upper level with a colonnade, a middle level with two obelisks, and a lower level with two chapels. It remains a UNESCO World Heritage Site and a major tourist attraction."
  },
  {
    "question": "What about Valley of the Kings and Queens?",
    "answer":
    "Valley of the Kings and Queens is a famous archaeological site located on the west bank of the Nile River near Luxor, Egypt. The Valley of the Kings is particularly famous for its association with the burial of Pharaohs, including Tutankhamun, Ramses II, and Hatshepsut. The tombs are adorned with intricate hieroglyphs, paintings, and religious scenes. Today, they are popular tourist destinations and UNESCO World Heritage Sites."
  },
  {
    "question": "What about The Tourism Souq?",
    "answer":
    "The Tourism Souq in Luxor is a marketplace located near major attractions like Luxor Temple, offering a variety of goods and services tailored to tourists. Visitors can find souvenirs, including traditional handicrafts. Local artisans showcase their crafts, and there are plenty of cafés and eateries to enjoy Egyptian cuisine. Additionally, the souq provides tourist services like tour guides and transportation, enhancing visitors' experiences in Luxor. Overall, it showcases Egyptian culture and offers memorable experiences for tourists."
  }
];

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final Gemini gemini = Gemini.instance;
  String _searchText = '';
  final TextEditingController _textEditingController = TextEditingController();
  List<String?> faqQuestions = faq.map((item) => item['question']).toList();

  List<String?> get filteredOptions => faqQuestions
      .where(
          (option) => option!.toLowerCase().contains(_searchText.toLowerCase()))
      .toList();
  ChatUser currentUser = ChatUser(
    id: '0',
    firstName: 'Ebtihal',
  );

  ChatUser geminiUser = ChatUser(
    id: '1',
    firstName: 'VIXOR',
    profileImage:
    'https://th.bing.com/th/id/OIP.W9wvIK6EBcuAuUFMObyUMAHaFj?rs=1&pid=ImgDetMain',
  );

  List<ChatMessage> messages = [];

  @override
  void initState() {
    super.initState();
    _initializeGemini();
  }

  void _initializeGemini() async {
    gemini;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: DashChat(
              messageOptions: MessageOptions(
                showOtherUsersName: true,
                avatarBuilder: (p0, onPressAvatar, onLongPressAvatar) {
                  if (p0.id == "0") {
                    return Container(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.brown[100],
                            child: Icon(
                              Icons.person,
                              color: Color(0xff6F4E37),
                            ),
                          ),
                          Text(
                            "You",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          )
                        ],
                      ),
                    );
                  } else {
                    return Container(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(p0.profileImage!),
                          ),
                          Text(
                            p0.firstName!,
                            style: TextStyle(color: Colors.grey, fontSize: 10),
                          )
                        ],
                      ),
                    );
                  }
                },
                currentUserContainerColor: const Color(0xff6F4E37),
                showCurrentUserAvatar: true,
                userNameBuilder: (user) {
                  return Container();
                },
                messageTextBuilder: (message, previousMessage, nextMessage) {
                  return AutoDirection(
                    text: message.text,
                    child: Text(
                      message.text,
                      style: TextStyle(
                          color: message.user.id == '0' ? Colors.white : null),
                    ),
                  );
                },
              ),
              inputOptions: InputOptions(
                inputTextDirection: getDirection(_textEditingController.text),
                onTextChange: (value) {
                  setState(() {
                    _searchText = value;
                  });
                },
                textController: _textEditingController,
                autocorrect: true,
                alwaysShowSend: true,
                sendButtonBuilder: (send) {
                  return IconButton(
                    onPressed: send,
                    icon: const Icon(Icons.send),
                  );
                },
                cursorStyle: const CursorStyle(
                  color: Colors.black,
                ),
              ),
              currentUser: currentUser,
              onSend: _sendMessage,
              messages: messages,
            ),
          ),
          if (_searchText.isNotEmpty && filteredOptions.isNotEmpty)
            SizedBox(
              height: 100,
              child: ListView.builder(
                itemCount: filteredOptions.length,
                itemBuilder: (context, index) {
                  final option = filteredOptions[index];
                  return Card(
                    child: InkWell(
                      onTap: () {
                        _textEditingController.text = option;
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child:
                        AutoDirection(text: option!, child: Text(option)),
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  TextDirection getDirection(String text) {
    if (text.contains(RegExp(r'[\u0600-\u06FF]'))) {
      return TextDirection.rtl;
    } else {
      return TextDirection.ltr;
    }
  }

  void _sendMessage(ChatMessage message) {
    setState(() {
      messages = [message, ...messages];
    });

    String question = message.text;
    String? response = getAnswerForQuestion(question);

    if (response != null) {
      ChatMessage replyMessage = ChatMessage(
        user: geminiUser,
        text: response,
        createdAt: DateTime.now(),
      );
      setState(() {
        messages = [replyMessage, ...messages];
      });
    } else {
      _getAnswerFromGemini(question);
    }
  }

  String? getAnswerForQuestion(String question) {
    for (var item in faq) {
      if (item['question']!.toLowerCase() == question.toLowerCase()) {
        return item['answer'];
      }
    }
    return null;
  }

  void _getAnswerFromGemini(String question) {
    gemini.streamGenerateContent(question).listen((event) {
      String response = event.content?.parts
          ?.fold('', (previous, current) => '$previous ${current.text}') ??
          'Sorry, I could not find an answer.';
      ChatMessage replyMessage = ChatMessage(
        user: geminiUser,
        text: response.replaceAll("*", ""),
        createdAt: DateTime.now(),
      );

      setState(() {
        messages = [replyMessage, ...messages];
      });
    });
  }
}
