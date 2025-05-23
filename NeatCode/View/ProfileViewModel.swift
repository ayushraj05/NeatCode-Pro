// ViewModel/ProfileViewModel.swift
import UIKit

/// ViewModel for profile data
class ProfileViewModel {
    private let profile: UserProfile
    init(profile: UserProfile) { self.profile = profile }

    var usernameText: String { profile.username }
    var avatarURL: URL? { URL(string: profile.avatarUrl) }
    var rankingText: String { "Ranking: #\(profile.ranking)" }
    var contributionText: String { "Contributions: \(profile.contributionPoint)" }
    var totalSolvedText: String { "Solved: \(profile.totalSolved) questions" }

    var breakdownValues: [CGFloat] {
        [CGFloat(profile.easySolved), CGFloat(profile.mediumSolved), CGFloat(profile.hardSolved)]
    }
    var breakdownLabels: [String] { ["Easy", "Medium", "Hard"] }
}