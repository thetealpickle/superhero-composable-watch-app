/*
 +----------------------------------------------------------------------+
 | PROJECT: WATCH TCA
 +----------------------------------------------------------------------+
 | Copyright (c) 2021 THETEALPICKLE LLC.
 | All Rights Reserved.
 +----------------------------------------------------------------------+
 | Author: Jessica Joseph <jessica@thetealpickle.com>
 +----------------------------------------------------------------------+
 */

import SwiftUI

struct SuperheroRowView: View {
    var model: Superhero
    
    var body: some View {
        GeometryReader { (container: GeometryProxy) in
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
            Text(self.model.name)
                    .font(.title2)
                    .fontWeight(.heavy)
            Text(self.model.work.occupation)
            Text(self.model.work.base)
        }
            Spacer()
            Button(action: {
                
            }) {
                Image(systemName: "heart\(self.model.favorited ? ".fill" : "")")
            }
            .foregroundColor(.red)
        }
        .padding(.horizontal, container.size.width * 0.05)
        .padding(.vertical, container.size.width * 0.03)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: container.size.width * 0.05)
                .foregroundColor(.yellow))
        }
    }
}

struct SuperheroRowView_Previews: PreviewProvider {
    static var previews: some View {
        SuperheroRowView(model: Superhero.sampleModel)
    }
}

