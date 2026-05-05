import 'package:flutter/material.dart';

// Transformar esta tela em uma tela ou "pop-up" para cada divisão de treino

class TelaSaibaMais extends StatelessWidget {
  const TelaSaibaMais({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mais sobre treinamento'),
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.white),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Text(
            "Lorem Ipsum 'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...' 'There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain...'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In pulvinar cursus nulla, id interdum enim mollis sit amet. Nunc vehicula mauris ut lorem mollis, vulputate fringilla ex bibendum. Praesent imperdiet tellus et lectus gravida, at congue lorem laoreet. Pellentesque id enim diam. Maecenas rhoncus commodo ipsum a egestas. Donec rhoncus tortor libero, eget tempus massa consequat sed. In risus mauris, finibus sed augue sed, luctus pulvinar turpis. Vestibulum sem est, commodo a rutrum et, scelerisque malesuada mauris. Vestibulum porta massa non lacus malesuada sollicitudin iaculis at diam. Interdum et malesuada fames ac ante ipsum primis in faucibus. Curabitur elementum elit vitae ante ullamcorper posuere. In hac habitasse platea dictumst. Integer quis diam tincidunt, porta mauris vitae, sodales felis. Aliquam erat volutpat. Vestibulum aliquet imperdiet lorem, a commodo tellus hendrerit quis. Cras posuere ex non erat interdum rutrum. Mauris non pulvinar nisl. Nam euismod consequat vulputate. Donec risus lectus, lacinia ornare dolor vel, facilisis feugiat mi. Maecenas mollis, nisi id ullamcorper mollis, risus enim sodales arcu, sed accumsan ex arcu ac neque. Aenean ex erat, efficitur eget molestie ut, consectetur at mauris. Nam egestas libero sit amet risus varius dictum. Quisque ac pretium nisi. Morbi at magna sapien. Fusce aliquam dolor eros, ac bibendum nisi scelerisque vitae. Proin nec elit sagittis, sagittis urna id, posuere mauris. Curabitur sit amet dignissim libero. Nam faucibus laoreet est ut bibendum. Curabitur at ligula ut nisl laoreet posuere sagittis et turpis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Ut tempor est magna, nec euismod leo finibus a. Donec dictum tortor at sodales imperdiet. Nunc ut ipsum efficitur, dignissim odio sed, euismod mi. Cras ornare luctus ex eget faucibus. In mollis nunc eget euismod viverra. Fusce et erat quam. Nulla tempus eros vitae dolor iaculis accumsan. Duis in nisl ut nisl placerat condimentum sed eu urna. Cras eros ex, sagittis et sapien nec, porta varius mi. Nam pretium ac elit ac sollicitudin. Maecenas eu dolor in massa ullamcorper venenatis sed at mi. Donec vitae cursus neque, nec elementum elit. Integer vitae rutrum ex. Nulla aliquam leo elit, non tristique est luctus in. Ut tempus dignissim lectus, in luctus urna sodales ac. Aenean ut tristique justo. Nulla quis vulputate sem. Integer tincidunt mauris sit amet enim tristique hendrerit. Nam et nisl efficitur, condimentum leo et, euismod enim. Cras lobortis gravida orci, vitae varius felis ullamcorper non. Etiam ultrices nibh eget est condimentum egestas fringilla sed nisl. Proin et elit at urna volutpat luctus. Praesent quis vehicula velit. Sed sodales libero interdum dictum pulvinar. Donec varius malesuada quam sit amet iaculis. Generated 5 paragraphs, 428 words, 2820 bytes of Lorem Ipsum",
          ),
        ),
      ),
    );
  }
}
