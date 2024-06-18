import 'dart:io';
import 'dart:typed_data';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:image_picker/image_picker.dart';

const String GEMINI_API_KEY = 'AIzaSyATicaAafi-vz0hgnOkp_U132hG_6Y3yaw';
List<Map<String, String>> faq = [

  {
    "question": "How can I plan my trip using the application?",
    "answer": "You can plan your trip by accessing the 'Trip Planning' feature, where the system suggests optimized trip itineraries focused on sustainable tourism. You can also customize your trip plan based on your preferences."
  },
  {
    "question": "Are there pre-made trip itineraries available?",
    "answer": "Yes, the system provides pre-made trip itineraries that prioritize sustainable tourism practices. You can choose from a variety of options tailored to different interests and durations."
  },
  {
    "question": "How can I find eco-friendly accommodations in Luxor?",
    "answer": "You can find eco-friendly accommodations by accessing the 'Accommodation Recommendations' feature, where the system recommends sustainable hotels based on your preferences."
  },
  {
    "question": "How can I access environmental preservation instructions at each location?",
    "answer": "Environmental preservation instructions are provided at each location through the 'Instructions for Environmental Preservation' feature, which is based on your location using GPS. You can access these instructions to minimize your environmental impact during your visit."
  },
  {
    "question": "Is the application available in multiple languages?",
    "answer": "Yes, the application is available in various languages to accommodate a wide range of users. You can select your preferred language from the app settings to access the content in your preferred language."
  },
  {
    "question": "How can I minimize my environmental footprint while exploring Luxor?",
    "answer": "You can minimize your environmental footprint by using eco-friendly transportation options like bicycles or public buses, supporting local conservation initiatives, and choosing accommodations with sustainable practices."
  },
  {
    "question": "What sustainable practices should I follow when visiting archaeological sites in Luxor?",
    "answer": "When visiting archaeological sites in Luxor, it's important to follow guidelines such as staying on designated paths, not touching or removing artifacts, and respecting the site's cultural significance."
  },
  {
    "question": "Are there any eco-friendly transportation options available for getting around Luxor?",
    "answer": "Yes, Luxor offers eco-friendly transportation options such as electric bikes, horse-drawn carriages, and walking tours that allow you to explore the city while minimizing your environmental impact."
  },
  {
    "question": "Can I learn about traditional crafts and handicrafts in Luxor?",
    "answer": "Yes, you can learn about traditional crafts and handicrafts in Luxor by visiting local markets, workshops, and cultural centers where artisans showcase their skills and sell handmade products."
  },
  {
    "question": "How can I support sustainable tourism initiatives in Luxor after leaving?",
    "answer": "You can support sustainable tourism initiatives in Luxor by sharing your positive experiences with others and supporting organizations that promote sustainable tourism in the region."
  },
  {
    "question": "What steps should I take to ensure I'm culturally respectful during my tourism activities?",
    "answer": "You should respect local customs and traditions, seek permission before taking photos, engage with local communities respectfully, and support culturally responsible businesses."
  },
  {
    "question": "What are some sustainable souvenir options I can purchase in Luxor?",
    "answer": "Sustainable souvenir options in Luxor include locally-made crafts, handmade textiles, traditional jewelry, and eco-friendly products sourced from local artisans."
  },
  {
    "question": "How can I reduce my waste while traveling in Luxor?",
    "answer": "You can reduce waste by carrying a reusable water bottle, avoiding single-use plastics, and disposing of waste responsibly in designated bins or recycling facilities."
  },
  {
    "question": "Can I customize my trip plan according to my interests?",
    "answer": "Absolutely! Our application offers optimized trip plans that prioritize sustainable tourism practices. You have the flexibility to customize your trip based on your interests, budget, and sustainability goals. This empowers you to explore Luxor in a way that aligns with your values while minimizing your environmental footprint."
  },
  {
    "question": "Are there any eco-friendly hotels recommended?",
    "answer": "Yes, we recommend eco-friendly hotels based on your preferences and availability. These accommodations play a crucial role in responsible tourism, and our recommendations ensure you have a comfortable and sustainable stay in Luxor."
  },
  {
    "question": "How can the chat bot assist me during my trip?",
    "answer": "The chat bot is designed to offer guidance on sustainable tourism practices, answer your queries, and suggest activities or attractions. It helps you make informed decisions while exploring Luxor, ensuring a memorable and responsible travel experience."
  },
  {
    "question": "How can I find sustainable locations in Luxor using the map feature?",
    "answer": "The map feature displays green and sustainable places such as eco-friendly hotels, nature reserves, and cultural sites. Different colors on the map signify different types of sustainable locations, making it easy for you to identify and explore them. This feature encourages you to visit sustainable destinations and promotes responsible travel behavior."
  },
  {
    "question": "What environmental preservation instructions are available at each location?",
    "answer": "Environmental preservation instructions tailored to your location using GPS educate you on ways to minimize your environmental impact during your visit. By following these guidelines, you contribute to the preservation of Luxor's natural and cultural heritage."
  },
  {
    "question": "How can I create a digital photo book of my sustainable travel experiences?",
    "answer": "You can create digital photo books to document your sustainable travel experiences in Luxor. Our application supports easy storage, retrieval, and sharing of photos, allowing you to share your memories with others and promote sustainable tourism."
  },

  {
    "question": "Is the application available in multiple languages?",
    "answer": "Yes, we offer the application in multiple languages to ensure accessibility to a diverse range of users, including international tourists. Language support enhances your experience and facilitates communication, making the application more inclusive and user-friendly."
  },
  {
    "question": "How can I include cultural experiences in my sustainable trip plan?",
    "answer": "You can customize your trip plan to include cultural experiences such as visits to historical landmarks, museums, and traditional festivals. Our recommendations ensure you engage with Luxor's cultural heritage while promoting sustainability."
  },
  {
    "question": "What criteria are used to recommend eco-friendly hotels?",
    "answer": "We recommend eco-friendly hotels based on criteria such as energy efficiency, waste management practices, community engagement, and certifications like Green Key or EarthCheck. These accommodations prioritize sustainability while offering comfortable stays for travelers."
  },
  {
    "question": "Are there budget-friendly options among the recommended eco-friendly hotels?",
    "answer": "Yes, we provide a range of eco-friendly hotels to suit various budgets. You can filter your preferences to find affordable and sustainable accommodation options in Luxor."
  },
  {
    "question": "How accurate is the map feature in identifying sustainable locations?",
    "answer": "The map feature utilizes accurate geospatial data to identify and display sustainable locations in Luxor. We collaborate with local authorities and organizations to ensure the reliability and relevance of the information provided."
  },
  {
    "question": "Can I navigate to sustainable locations using the map feature?",
    "answer": "Yes, you can use the map feature to navigate to sustainable locations such as eco-friendly hotels, nature reserves, and cultural sites. The interactive map makes it easy for you to explore Luxor responsibly and enjoy eco-conscious travel experiences."
  },
  {
    "question": "What specific environmental guidelines should I follow when visiting archaeological sites in Luxor?",
    "answer": "When visiting archaeological sites, it's important to respect signage, avoid touching or damaging ancient structures, and dispose of waste properly. Our environmental preservation instructions provide guidance on responsible behavior to protect Luxor's cultural heritage."
  },
  {
    "question": "How can I minimize my environmental impact while exploring Luxor's natural attractions?",
    "answer": "To minimize your environmental impact, practice Leave No Trace principles such as packing out waste, staying on designated trails, and avoiding wildlife disturbance. Our instructions for environmental preservation offer tips for responsible behavior in natural areas."
  },
  {
    "question": "Can I share my digital photo book with friends and family?",
    "answer": "Yes, you can easily share your digital photo book with friends and family through social media platforms, email, or messaging apps. Document your sustainable travel experiences in Luxor and inspire others to adopt eco-friendly practices."
  },

  {
    "question": "How can tourists ensure their visit to Luxor supports sustainable development?",
    "answer": "Tourists can support sustainable development in Luxor by choosing eco-friendly accommodations, respecting cultural and environmental sensitivities, minimizing their carbon footprint, and contributing to local conservation efforts through responsible tourism activities."
  },

  {
    "question": "What is sustainable tourism?",
    "answer": "Sustainable tourism refers to tourism activities that strive to minimize negative environmental, social, and cultural impacts while maximizing benefits for local communities, economies, and ecosystems, both now and in the future."
  },
  {
    "question": "What are some sustainable attractions to visit in Luxor?",
    "answer": "Some sustainable attractions in Luxor include Karnak Temple, Luxor Temple, Valley of the Kings, Valley of the Queens, and Hatshepsut's Temple. These historical sites offer rich cultural experiences while promoting responsible tourism practices."
  },
  {
    "question": "What about Luxor Temple?",
    "answer": "Luxor Temple is one of the most significant ancient Egyptian temples located on the east bank of the Nile River in Luxor, Egypt. Connected to the Karnak Temple Complex by the Avenue of Sphinxes, it was constructed around 1400 BCE during the New Kingdom period."
  },
  {
    "question": "What about Karnak Temple?",
    "answer": "The Karnak Temple Complex in Luxor, Egypt, is one of the largest temple complexes ever built, including the iconic Great Hypostyle Hall and the Precinct of Amun-Re. Connected to Luxor Temple by the Avenue of Sphinxes, Karnak Temple is a UNESCO World Heritage Site and a major tourist attraction."
  },
  {
    "question": "What about Luxor Museum?",
    "answer": "The Luxor Museum is an archaeological museum located on the east bank of the Nile River in Luxor, Egypt. It houses a remarkable collection of artifacts from the ancient Egyptian era, including statues, reliefs, pottery, and jewelry. The museum provides visitors with insights into ancient Egyptian history, culture, and artistry."
  },
  {
    "question": "What about Avenue of Sphinxes?",
    "answer": "The Avenue of Sphinxes is a historic pathway lined with sphinx statues that once connected the Luxor Temple to the Karnak Temple Complex in Luxor, Egypt. It served as a ceremonial pathway for religious processions."
  },
  {
    "question": "What about Hatshepsut Temple?",
    "answer": "The Hatshepsut Temple, also known as the Temple of Queen Hatshepsut or Deir el-Bahari, is an ancient Egyptian temple located on the west bank of the Nile River near Luxor. It is a remarkable ancient Egyptian temple built by Queen Hatshepsut and serves as a mortuary temple dedicated to the god Amun and her father Thutmose I. The temple consists of three levels: an upper level with a colonnade, a middle level with two obelisks, and a lower level with two chapels. It remains a UNESCO World Heritage Site and a major tourist attraction."
  },
  {
    "question": "What about Valley of the Kings and Queens?",
    "answer": "Valley of the Kings and Queens is a famous archaeological site located on the west bank of the Nile River near Luxor, Egypt. The Valley of the Kings is particularly famous for its association with the burial of Pharaohs, including Tutankhamun, Ramses II, and Hatshepsut. The tombs are adorned with intricate hieroglyphs, paintings, and religious scenes. Today, they are popular tourist destinations and UNESCO World Heritage Sites."
  },
  {
    "question": "What about The Tourism Souq?",
    "answer": "The Tourism Souq in Luxor is a marketplace located near major attractions like Luxor Temple, offering a variety of goods and services tailored to tourists. Visitors can find souvenirs, including traditional handicrafts. Local artisans showcase their crafts, and there are plenty of cafés and eateries to enjoy Egyptian cuisine. Additionally, the souq provides tourist services like tour guides and transportation, enhancing visitors' experiences in Luxor. Overall, it showcases Egyptian culture and offers memorable experiences for tourists."
  }


];
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final Gemini gemini = Gemini.instance;

  ChatUser currentUser = ChatUser(
    id: '0',
    firstName: 'Ebtihal',
  );

  ChatUser geminiUser = ChatUser(
    id: '1',
    firstName: 'VIXOR',
    profileImage:
'https://th.bing.com/th/id/OIP.W9wvIK6EBcuAuUFMObyUMAHaFj?rs=1&pid=ImgDetMain'  );

  List<ChatMessage> messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    /*  appBar: AppBar(
        title: Text('Chat with VIXOR'),
      ),*/
      body: DashChat(
        inputOptions: InputOptions(
          autocorrect: true,
          alwaysShowSend: true,
          sendButtonBuilder: (send) {
            return IconButton(
              onPressed: send,
              icon: Icon(Icons.send),
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

      floatingActionButton: Container(
        margin: EdgeInsets.all(35),
        child: FloatingActionButton(
          onPressed: _sendMediaMessage,

          child: Icon(Icons.image),
        ),
      ),
    );
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
      String response = event.content?.parts?.fold(
          '', (previous, current) => '$previous ${current.text}') ??
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

  void _sendMediaMessage() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      ChatMessage message = ChatMessage(
        user: currentUser,
        text: 'Describe this picture?',
        medias: [
          ChatMedia(
            fileName: '',
            type: MediaType.image,
            url: file.path,
          ),
        ],
        createdAt: DateTime.now(),
      );
      _sendMessage(message);
    }
  }
}